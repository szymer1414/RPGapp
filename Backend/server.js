const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const db = require('./db');  // Assuming `db` is correctly configured in 'db.js'
const npcRoutes = require('./routes/npc');

const app = express();
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());

app.use('/api', npcRoutes); // NPC specific routes

// Route: Get Traits
app.get('/trait', (req, res) => {
  const sql = `
    SELECT trait_id, name, description, contrast_trait_id
    FROM trait
    ORDER BY RAND()
  `;

  db.query(sql, (err, allTraits) => {
    if (err) return res.json(err);

    let selectedTraits = [];
    for (let i = 0; i < allTraits.length; i++) {
      let conflict = false;
      for (let j = 0; j < selectedTraits.length; j++) {
        if (
          allTraits[i].contrast_trait_id === selectedTraits[j].trait_id ||
          allTraits[i].trait_id === selectedTraits[j].contrast_trait_id
        ) {
          conflict = true;
          break;
        }
      }
      if (!conflict) {
        selectedTraits.push(allTraits[i]);
        if (selectedTraits.length === 3) break;
      }
    }

    return res.json(selectedTraits);
  });
});

// Route: Roll Country
app.get('/roll-country', (req, res) => {
  const sql = `SELECT country_id AS id, name, probability FROM country`;

  db.query(sql, (err, countries) => {
    if (err) return res.json(err);

    const totalProbability = countries.reduce((acc, country) => acc + country.probability, 0);
    const random = Math.random() * totalProbability;

    let cumulativeProbability = 0;
    let selectedCountry = null;

    for (let country of countries) {
      cumulativeProbability += country.probability;
      if (random <= cumulativeProbability) {
        selectedCountry = country;
        break;
      }
    }

    return res.json(selectedCountry);
  });
});

// Route: Roll Random Name and Surname based on Country
app.get('/roll-name', (req, res) => {
  const { countryId } = req.query;
  if (!countryId) return res.status(400).json({ error: 'Country ID is required' });

  const sqlName = `SELECT name_id AS id, name FROM name WHERE country_id = ? ORDER BY RAND() LIMIT 1`;
  const sqlSurname = `SELECT surname_id AS id, surname FROM surname WHERE country_id = ? ORDER BY RAND() LIMIT 1`;

  db.query(sqlName, [countryId], (err, nameResult) => {
    if (err) return res.json(err);
    const name = nameResult[0];

    db.query(sqlSurname, [countryId], (err, surnameResult) => {
      if (err) return res.json(err);
      const surname = surnameResult[0];

      return res.json({ name, surname });
    });
  });
});

// Route: Get Stat Names
app.get('/stat-names', (req, res) => {
  const sql = `SELECT stat_id, name FROM stat`;
  db.query(sql, (err, result) => {
    if (err) return res.json(err);
    return res.json(result);
  });
});

// Route: Roll Skills
app.get('/roll-skills', (req, res) => {
  const { stat, limit } = req.query;
  if (!stat || !limit) return res.status(400).json({ error: 'Stat ID and limit are required' });

  const sql = `SELECT skill_id, name FROM skill WHERE stat_id = ? ORDER BY RAND() LIMIT ?`;

  db.query(sql, [stat, parseInt(limit)], (err, skills) => {
    if (err) return res.json(err);
    return res.json(skills);
  });
});

// Route: Save NPC (Insert New NPC)
app.post('/save-npc', (req, res) => {
  const { name_id, surname_id, country_id, stats, skills, traits } = req.body;
  const insertNpcQuery = `INSERT INTO npc (name_id, surname_id, country_id) VALUES (?, ?, ?)`;

  db.query(insertNpcQuery, [name_id, surname_id, country_id], (err, result) => {
    if (err) {
      console.error("Error inserting NPC:", err);
      return res.status(500).json({ error: "Failed to save NPC" });
    }

    const npcId = result.insertId;

    // Prepare the data for npc_stat, npc_skill, and npc_trait
    const npcStatValues = stats.map((stat, index) => [npcId, index + 1, stat]);
    const npcSkillValues = skills.flatMap(skillGroup =>
      skillGroup.skills.map(skill => [npcId, skill.id, skill.value])
    );
    const npcTraitValues = traits.map(traitId => [npcId, traitId]);

    // Insert stats
    const insertNpcStatQuery = `INSERT INTO npc_stat (npc_id, stat_id, proficiency_level) VALUES ?`;
    db.query(insertNpcStatQuery, [npcStatValues], (err) => {
      if (err) console.error("Error inserting NPC stats:", err);
    });

    // Insert skills
    const insertNpcSkillQuery = `INSERT INTO npc_skill (npc_id, skill_id, proficiency_level) VALUES ?`;
    db.query(insertNpcSkillQuery, [npcSkillValues], (err) => {
      if (err) console.error("Error inserting NPC skills:", err);
    });

    // Insert traits
    const insertNpcTraitQuery = `INSERT INTO npc_trait (npc_id, trait_id) VALUES ?`;
    db.query(insertNpcTraitQuery, [npcTraitValues], (err) => {
      if (err) console.error("Error inserting NPC traits:", err);
    });

    return res.json({ npcId });
  });
});

//
// Updated Endpoint for NPC Stats and Skills Update
//
app.put('/api/characters/:id', (req, res) => {
  const characterId = req.params.id;
  const { stats, skills } = req.body;  // Expecting stats and skills as arrays of objects

  if (!Array.isArray(stats) || !Array.isArray(skills)) {
    return res.status(400).json({ message: 'Stats and skills must be provided as arrays.' });
  }

  // Update NPC stats
  const updateStatQuery = `UPDATE npc_stat SET proficiency_level = ? WHERE npc_id = ? AND stat_id = ?`;
  const deleteStatQuery = `DELETE FROM npc_stat WHERE npc_id = ? AND stat_id = ?`;

  stats.forEach(stat => {
    if (stat.proficiency_level > 0) {
      db.query(updateStatQuery, [stat.proficiency_level, characterId, stat.stat_id], (err) => {
        if (err) console.error('Error updating NPC stats:', err);
      });
    } else {
      // If proficiency_level is 0, delete the stat
      db.query(deleteStatQuery, [characterId, stat.stat_id], (err) => {
        if (err) console.error('Error deleting NPC stat:', err);
      });
    }
  });

  // Update NPC skills
  const updateSkillQuery = `UPDATE npc_skill SET proficiency_level = ? WHERE npc_id = ? AND skill_id = ?`;
  const insertSkillQuery = `INSERT INTO npc_skill (npc_id, skill_id, proficiency_level) VALUES (?, ?, ?)`;
  const deleteSkillQuery = `DELETE FROM npc_skill WHERE npc_id = ? AND skill_id = ?`;

  skills.forEach(skill => {
    if (skill.proficiency_level > 0) {
      // If the skill exists, update it; if not, insert it
      db.query(updateSkillQuery, [skill.proficiency_level, characterId, skill.skill_id], (err, result) => {
        if (err) console.error('Error updating NPC skill:', err);
        if (result.affectedRows === 0) {  // If no rows were affected, the skill doesn't exist, so insert it
          db.query(insertSkillQuery, [characterId, skill.skill_id, skill.proficiency_level], (err) => {
            if (err) console.error('Error inserting NPC skill:', err);
          });
        }
      });
    } else {
      // If proficiency level is 0, delete the skill
      db.query(deleteSkillQuery, [characterId, skill.skill_id], (err) => {
        if (err) console.error('Error deleting NPC skill:', err);
      });
    }
  });

  // Response after all updates are initiated
  res.json({ message: 'NPC stats and skills updated successfully' });
});

// Start the server
const PORT = process.env.PORT || 8081;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

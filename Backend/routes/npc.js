// backend/routes/npc.js
const express = require('express');
const router = express.Router();
const db = require('../db'); // Correct path to db.js

// Define routes
router.get('/characters', (req, res) => {
    const sql = `
      SELECT npc.npc_id, name.name AS first_name, surname.surname AS last_name
      FROM npc
      JOIN name ON npc.name_id = name.name_id
      JOIN surname ON npc.surname_id = surname.surname_id
    `;

    db.query(sql, (err, result) => {
        if (err) {
          console.error("Error fetching characters:", err);
          return res.status(500).json({ error: "Failed to fetch characters" });
        }
        return res.json(result);
    });
});

router.get('/characters/:id', (req, res) => {
    const { id } = req.params;
    
    // SQL queries
    const characterSql = `
      SELECT npc.npc_id, name.name AS first_name, surname.surname AS last_name
      FROM npc
      JOIN name ON npc.name_id = name.name_id
      JOIN surname ON npc.surname_id = surname.surname_id
      WHERE npc.npc_id = ?
    `;

    const traitsSql = `
      SELECT trait.trait_id, trait.name AS trait_name, trait.description
      FROM npc_trait
      JOIN trait ON npc_trait.trait_id = trait.trait_id
      WHERE npc_trait.npc_id = ?
    `;

    const statsSql = `
      SELECT stat.stat_id, stat.name AS stat_name, npc_stat.proficiency_level
      FROM npc_stat
      JOIN stat ON npc_stat.stat_id = stat.stat_id
      WHERE npc_stat.npc_id = ?
    `;

    const skillsSql = `
      SELECT stat.stat_id, skill.skill_id, skill.name AS skill_name, COALESCE(npc_skill.proficiency_level, 0) AS value
      FROM stat
      JOIN skill ON stat.stat_id = skill.stat_id
      LEFT JOIN npc_skill ON skill.skill_id = npc_skill.skill_id AND npc_skill.npc_id = ?
      WHERE stat.stat_id IN (SELECT stat_id FROM npc_stat WHERE npc_id = ?)
    `;

    // Fetch character details
    db.query(characterSql, [id], (err, characterResult) => {
        if (err) {
            console.error("Error fetching character details:", err);
            return res.status(500).json({ error: "Failed to fetch character details" });
        }
        if (characterResult.length === 0) {
            return res.status(404).json({ error: "Character not found" });
        }

        // Fetch traits
        db.query(traitsSql, [id], (err, traitsResult) => {
            if (err) {
                console.error("Error fetching character traits:", err);
                return res.status(500).json({ error: "Failed to fetch character traits" });
            }

            // Fetch stats and skills
            db.query(statsSql, [id], (err, statsResult) => {
                if (err) {
                    console.error("Error fetching character stats:", err);
                    return res.status(500).json({ error: "Failed to fetch character stats" });
                }

                // Fetch skills
                db.query(skillsSql, [id, id], (err, skillsResult) => {
                    if (err) {
                        console.error("Error fetching character skills:", err);
                        return res.status(500).json({ error: "Failed to fetch character skills" });
                    }

                    // Combine results
                    const statsWithSkills = statsResult.map(stat => ({
                        ...stat,
                        skills: skillsResult.filter(skill => skill.stat_id === stat.stat_id)
                    }));

                    const character = {
                        ...characterResult[0],
                        traits: traitsResult,
                        stats: statsWithSkills
                    };

                    return res.json(character);
                });
            });
        });
    });
});

module.exports = router;

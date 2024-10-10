import React from 'react';
import axios from 'axios';

const ChangeStats = ({ character, setCharacter }) => {
  // Handle stat button click (left-click for increment, right-click for decrement)
  const handleStatButtonClick = (statId, increment = true) => {
    setCharacter(prevCharacter => {
      const updatedStats = prevCharacter.stats.map(stat => {
        if (stat.stat_id === statId) {
          const updatedProficiencyLevel = increment
            ? Math.min(stat.proficiency_level + 1, 5) // Ensure it doesn't exceed 5
            : Math.max(stat.proficiency_level - 1, 0); // Ensure it doesn't go below 0
          return { ...stat, proficiency_level: updatedProficiencyLevel };
        }
        return stat;
      });
      return { ...prevCharacter, stats: updatedStats };
    });
  };

  const handleSkillButtonClick = (statId, skillId, increment = true) => {
    setCharacter(prevCharacter => {
      const updatedStats = prevCharacter.stats.map(stat => {
        if (stat.stat_id === statId) {
          const updatedSkills = stat.skills.map(skill => {
            if (skill.skill_id === skillId) {
              const newValue = increment
                ? Math.min(skill.value + 1, 5) // Increase, cap at 5
                : Math.max(skill.value - 1, 0); // Decrease, floor at 0

              return { ...skill, value: newValue };  // Update the skill value
            }
            return skill;  // Return unchanged skill
          });
          return { ...stat, skills: updatedSkills };  // Return the updated stat with modified skills
        }
        return stat;  // Return unchanged stat
      });
      return { ...prevCharacter, stats: updatedStats };  // Return updated character with modified stats
    });
  };

  // Save changes to the server
  const saveChanges = () => {
    const updatedStats = character.stats.map(stat => ({
      stat_id: stat.stat_id,
      proficiency_level: stat.proficiency_level
    }));

    const updatedSkills = character.stats.flatMap(stat =>
      stat.skills.map(skill => ({
        skill_id: skill.skill_id,
        proficiency_level: skill.value
      }))
    );

    axios.put(`http://localhost:8081/api/characters/${character.npc_id}`, {
      stats: updatedStats,
      skills: updatedSkills
    })
      .then(response => {
        console.log('Update successful:', response.data);
        alert("NPC Changed"); // Show error alert
      })
      .catch(error => {
        console.error('Error updating character:', error);
      });
  };


  // Get button color based on value
  const getButtonStyle = (value) => {
    if (value === 0) return { backgroundColor: '#fff', color: '#000', marginRight: '0' }; // White with black text
    if (value === 5) return { backgroundColor: '#FFD700', color: '#000', marginRight: '0' }; // Gold with black text
    return { backgroundColor: '#4CAF50', color: '#fff', marginRight: '0' }; // Green with white text
  };

  return (
    <div>
      <h2>Edit Stats</h2>
      <div className="stats-grid">
        {character.stats.map(stat => (
          <div className="stat-item" key={stat.stat_id}>
            <div className="stat-header">
              <strong>{stat.stat_name}</strong>
              <button
                onClick={() => handleStatButtonClick(stat.stat_id, true)}  // Increment on left-click
                onContextMenu={(e) => {
                  e.preventDefault();  // Prevent right-click context menu
                  handleStatButtonClick(stat.stat_id, false);  // Decrement on right-click
                }}
                className="proficiency-button"
                style={getButtonStyle(stat.proficiency_level)}
              >
                {stat.proficiency_level}
              </button>
            </div>
            <hr />
            <ul>
              {stat.skills.length > 0 ? (
                stat.skills.map(skill => (
                  <li key={skill.skill_id}>
                    <strong>{skill.skill_name}</strong>
                    <button
                      onClick={() => handleSkillButtonClick(stat.stat_id, skill.skill_id, true)}  // Increment on left-click
                      onContextMenu={(e) => {
                        e.preventDefault();  // Prevent right-click context menu
                        handleSkillButtonClick(stat.stat_id, skill.skill_id, false);  // Decrement on right-click
                      }}
                      style={getButtonStyle(skill.value)}
                    >
                      {skill.value}
                    </button>
                  </li>
                ))
              ) : (
                <li>No skills found</li>
              )}
            </ul>
          </div>
        ))}
      </div>
      <button onClick={saveChanges} style={{ marginTop: '20px', backgroundColor: '#4CAF50', color: '#fff' }}>
        Save Changes
      </button>
    </div>
  );
};

export default ChangeStats;

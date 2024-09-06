import React, { useEffect, useState } from 'react';
import { useParams, Route, Routes, Link } from 'react-router-dom';
import axios from 'axios';
import './styles/CharacterDetail.css'; // Import the CSS file for styling

import Sidebar from './componentsCharacter/Sidebar';
import ChangeData from './componentsCharacter/ChangeData';
import ChangeStats from './componentsCharacter/ChangeStats';

const CharacterDetail = () => {
  const { id } = useParams();
  const [character, setCharacter] = useState(null);

  const fetchCharacterDetail = async () => {
    try {
      const response = await axios.get(`http://localhost:8081/api/characters/${id}`);
      const updatedCharacter = {
        ...response.data,
        stats: response.data.stats.map(stat => ({
          ...stat,
          skills: stat.skills.map(skill => ({
            ...skill,
            disabled: true
          }))
        }))
      };
      setCharacter(updatedCharacter);
    } catch (error) {
      console.error('Error fetching character details:', error);
    }
  };

  useEffect(() => {
    fetchCharacterDetail();
  }, [id]);

  const handleButtonClick = (statId, skillId) => {
    setCharacter(prevCharacter => {
      const updatedStats = prevCharacter.stats.map(stat => {
        if (stat.stat_id === statId) {
          const updatedSkills = stat.skills.map(skill =>
            skill.skill_id === skillId
              ? { ...skill, disabled: true }
              : skill
          );
          return { ...stat, skills: updatedSkills };
        }
        return stat;
      });
      return { ...prevCharacter, stats: updatedStats };
    });
  };

  if (!character) {
    return <div>Loading...</div>;
  }

  return (
    <div className="character-detail-page">
      <Sidebar />
      <div className="character-detail-content">
        <h1>Character Detail</h1>
        <p>ID: {character.npc_id}</p>
        <p>Name: {character.first_name}</p>
        <p>Surname: {character.last_name}</p>

        <h2>Traits</h2>
        <ul>
          {character.traits.map(trait => (
            <li key={trait.trait_id}>
              <strong>{trait.trait_name}</strong>: {trait.description}
            </li>
          ))}
        </ul>

        <h2>Stats</h2>
        <div className="stats-grid">
          {character.stats.map(stat => (
            <div className="stat-item" key={stat.stat_id}>
              <strong>{stat.stat_name}</strong>
              <p>Proficiency Level: {stat.proficiency_level}</p>
              <h3>Skills</h3>
              <ul>
                {stat.skills.length > 0 ? (
                  stat.skills.map(skill => (
                    <li key={skill.skill_id}>
                      <strong>{skill.skill_name}</strong>
                      <button 
                        onClick={() => handleButtonClick(stat.stat_id, skill.skill_id)}
                        disabled={skill.disabled}
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

        <Routes>

          <Route path="change-data" element={<ChangeData />} />
          <Route path="change-stats" element={<ChangeStats />} />
          {/* Add other routes for "Level Up" and "Remove Character" */}
        </Routes> 
      </div>
    </div>
  );
};

export default CharacterDetail;

import React, { useEffect, useState } from 'react';
import { useParams, Route, Routes, useLocation } from 'react-router-dom';
import axios from 'axios';
import './styles/CharacterDetail.css'; // Import the CSS file for styling

import Sidebar from './componentsCharacter/Sidebar';
import ChangeData from './componentsCharacter/ChangeData';
import ChangeStats from './componentsCharacter/ChangeStats';

const CharacterDetail = () => {
  const { id } = useParams();
  const [character, setCharacter] = useState(null);
  const location = useLocation(); // Get the current route

  // Check if the current route is the ChangeStats page
  const isChangeStatsPage = location.pathname === `/character/${id}/change-stats`;

  const fetchCharacterDetail = async () => {
    try {
      const response = await axios.get(`http://localhost:8081/api/characters/${id}`);
      const updatedCharacter = {
        ...response.data,
        stats: response.data.stats.map(stat => ({
          ...stat,
          // Sort skills based on proficiency_level in descending order
          skills: stat.skills
            .sort((a, b) => a.skill_id - b.skill_id) // Sorting skills based on proficiency level (b - a for descending)
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

  if (!character) {
    return <div>Loading...</div>;
  }

  // Conditionally render content based on the route
  const isBaseCharacterPage = location.pathname === `/character/${id}`;

  return (
    <div className="character-detail-page">
      <Sidebar />
      <div className="character-detail-content">
        {/* Show Character Info (Traits and Basic Info) only on the base route or change-data */}
        {(isBaseCharacterPage ) && (
          <>
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
          </>
        )}

        {/* Show Stats only on the base character detail page, not on ChangeStats */}
        {isBaseCharacterPage && (
          <>
            <h2>Stats</h2>
            <div className="stats-grid">
              {character.stats.map(stat => (
                <div className="stat-item" key={stat.stat_id}>
                  <div className="stat-header">
                    <strong>{stat.stat_name}</strong>
                    <button
                      disabled  // Disable button since we're on base page
                      className="proficiency-button"
                      style={{
                        marginRight: '0',
                        backgroundColor: stat.proficiency_level === 0 ? '#fff' : '#4CAF50',
                        color: stat.proficiency_level === 0 ? '#000' : '#fff'
                      }}
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
                            disabled  // Disable button since we're on base page
                            style={{
                              color: skill.value === 0 ? '#fff' : '#4CAF50', // Text color based on skill value
                            }}
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
          </>
        )}

        <Routes>
          <Route path="change-stats" element={<ChangeStats character={character} setCharacter={setCharacter} />} />
        </Routes>
      </div>
    </div>
  );
};

export default CharacterDetail;

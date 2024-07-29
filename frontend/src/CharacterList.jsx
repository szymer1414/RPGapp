import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const CharacterList = () => {
  const [characters, setCharacters] = useState([]);

  const fetchCharacters = async () => {
    try {
      const response = await axios.get('http://localhost:8081/api/characters');
      console.log(response.data); // Debugging: log the response data
      setCharacters(response.data);
    } catch (error) {
      console.error('Error fetching characters:', error);
    }
  };

  useEffect(() => {
    fetchCharacters();
  }, []);

  return (
    <div>
      <h1>Character List</h1>
      <ul>
        {characters.map((character) => (
          <li key={character.npc_id}>
            <Link to={`/character/${character.npc_id}`}>
              {character.npc_id}: {character.first_name} {character.last_name}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CharacterList;

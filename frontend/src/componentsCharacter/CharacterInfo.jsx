// CharacterInfo.jsx
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

const CharacterInfo = () => {
  const { id } = useParams();
  const [character, setCharacter] = useState(null);

  useEffect(() => {
    const fetchCharacterDetail = async () => {
      try {
        const response = await axios.get(`http://localhost:8081/api/characters/${id}`);
        setCharacter(response.data);
      } catch (error) {
        console.error('Error fetching character details:', error);
      }
    };

    fetchCharacterDetail();
  }, [id]);

  if (!character) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h1>Character Info</h1>
      <p>{character.first_name} {character.last_name}</p>
      {/* Other character details */}
    </div>
  );
};

export default CharacterInfo;

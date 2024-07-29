import React, { useState, useEffect } from "react";
import axios from "axios";
import "./styles/TraitsList.css"; // Import the CSS file

const TraitsList = ({ setTraits }) => {
  const [traits, setLocalTraits] = useState([]);

  const fetchTraits = async () => {
    try {
      const response = await axios.get("http://localhost:8081/trait");
      setLocalTraits(response.data);
      setTraits(response.data.map(trait => trait.trait_id));
    } catch (error) {
      console.error("Error fetching traits:", error);
    }
  };

  useEffect(() => {
    fetchTraits();
  }, []);

  return (
    <div>
      <div className="traits-container">
        {traits.map((trait) => (
          <div key={trait.trait_id} className="trait-card">
            <strong className="trait-name">{trait.name}</strong>
            <div className="trait-description">{trait.description}</div>
          </div>
        ))}
      </div>
      <button onClick={fetchTraits} className="roll-button">
        Roll Again
      </button>
    </div>
  );
};

export default TraitsList;

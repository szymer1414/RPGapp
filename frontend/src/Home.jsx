import React, { useState, useEffect } from "react";
import TraitsList from "./components/TraitsList";
import { generateStats, StatsSection } from "./components/statUtils";
import { rollCountry, rollNameAndSurname, OriginSection } from "./components/originUtils";
import "./styles/Home.css";
import axios from "axios";

const Home = () => {
  const [rolledCountry, setRolledCountry] = useState(null);
  const [rolledName, setRolledName] = useState(null);
  const [rolledSurname, setRolledSurname] = useState(null);
  const [stats, setStats] = useState([]);
  const [statNames, setStatNames] = useState([]);
  const [skills, setSkills] = useState([]);
  const [traits, setTraits] = useState([]);

  useEffect(() => {
    const fetchStatNames = async () => {
      try {
        const response = await axios.get("http://localhost:8081/stat-names");
        setStatNames(response.data);
      } catch (error) {
        console.error("Error fetching stat names:", error);
      }
    };
    fetchStatNames();
  }, []);

  const handleRollCountry = async () => {
    const country = await rollCountry();
    setRolledCountry(country);
    handleRollNameAndSurname(country.id);
  };

  const handleRollNameAndSurname = async (countryId) => {
    const nameAndSurname = await rollNameAndSurname(countryId);
    setRolledName(nameAndSurname.name);
    setRolledSurname(nameAndSurname.surname);
  };

  const rollStats = () => {
    const rolledStats = generateStats();
    setStats(rolledStats);
  };

  const saveToDatabase = async () => {
    try {
      const npcData = {
        name_id: rolledName.id,
        surname_id: rolledSurname.id,
        country_id: rolledCountry.id,
        stats,
        skills,
        traits,
      };

      console.log("Saving NPC Data:", npcData); // Log the data being sent to the backend

      const response = await axios.post("http://localhost:8081/save-npc", npcData);
      console.log("NPC saved successfully with ID:", response.data.npcId);
    } catch (error) {
      console.error("Error saving NPC:", error);
    }
  };

  return (
    <div className="home">
      <div className="columns">
        <div className="column">
          <OriginSection 
            rolledCountry={rolledCountry}
            rolledName={rolledName}
            rolledSurname={rolledSurname}
            onRollCountry={handleRollCountry}
          />
        </div>
        <div className="column">
          <TraitsList setTraits={setTraits} />
        </div>
      </div>
      <div className="full-width">
        <StatsSection stats={stats} setStats={setStats} skills={skills} setSkills={setSkills} />
      </div>
      <div className="save-container">
        <button onClick={saveToDatabase} className="save-button">Save to Database</button>
      </div>
    </div>
  );
};

export default Home;

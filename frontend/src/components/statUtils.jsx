import React, { useEffect, useState } from "react";
import axios from "axios";
import "./styles/statUtils.css"; // Import the CSS file

// Function to generate stats
export const generateStats = () => {
  const distribution = {
    1: 5,
    2: 50,
    3: 40,
    4: 5
  };

  let newStats = [];
  for (let i = 0; i < 6; i++) {
    const rand = Math.random() * 100;
    let stat = 0;
    let accumulatedPercent = 0;
    for (const [value, percent] of Object.entries(distribution)) {
      accumulatedPercent += percent;
      if (rand <= accumulatedPercent) {
        stat = parseInt(value);
        break;
      }
    }
    newStats.push(stat);
  }

  // Check and adjust stats to ensure no multiple 1s or 4s
  while (!checkStats(newStats)) {
    newStats = generateStats();
  }

  return newStats;
};

// Function to check if there are multiple 1s or 4s
const checkStats = (stats) => {
  const onesCount = stats.filter((stat) => stat === 1).length;
  const foursCount = stats.filter((stat) => stat === 4).length;

  return onesCount <= 1 && foursCount <= 1;
};

// Function to generate skill value
const rollSkillValue = () => {
  const distribution = {
    1: 20,
    2: 35,
    3: 30,
    4: 14,
    5: 1
  };

  const rand = Math.random() * 100;
  let value = 1;
  let accumulatedPercent = 0;
  
  for (const [val, percent] of Object.entries(distribution)) {
    accumulatedPercent += percent;
    if (rand <= accumulatedPercent) {
      value = parseInt(val);
      break;
    }
  }

  return value;
};

// Custom hook to fetch stat names
export const useStatNames = () => {
  const [statNames, setStatNames] = useState([]);

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

  return statNames;
};

// Function to fetch skills based on stat ID and number of skills
export const rollSkillsByStat = async (statId, numberOfSkills) => {
  try {
    const response = await axios.get("http://localhost:8081/roll-skills", {
      params: {
        stat: statId,
        limit: numberOfSkills,
      },
    });

    // Assign values to each skill
    return response.data.map(skill => ({
      id: skill.skill_id, // Adjust if response data is a string
      name: skill.name, // Adjust if response data is a string
      value: rollSkillValue() // Assign value based on the distribution
    }));
  } catch (error) {
    console.error("Error fetching skills:", error);
    return [];
  }
};

// Component to handle the stats section
export const StatsSection = ({ stats, setStats, skills, setSkills }) => {
  const statNames = useStatNames();

  const rollStats = async () => {
    const rolledStats = generateStats();
    setStats(rolledStats);

    // Fetch skills for each stat
    const skillsByStat = await Promise.all(
      rolledStats.map(async (stat, index) => {
        const skills = await rollSkillsByStat(index + 1, stat);
        return { statId: index + 1, skills };
      })
    );

    setSkills(skillsByStat);
  };

  return (
    <div>
      <div className="stats-container">
        {statNames.length > 0 && statNames.map((stat, index) => (
          <div key={stat.stat_id} className="stat-card">
            <strong>{stat.name}</strong>
            <div className="stat-value">
              {stats[index] !== undefined ? stats[index] : "0"}
            </div>
            <ul>
              {skills.find(s => s.statId === stat.stat_id)?.skills.map((skill, idx) => (
                <li key={idx}>
                  {skill.name} {skill.value} (ID: {skill.id})
                </li>
              )) || <li>No skills available</li>}
            </ul>
          </div>
        ))}
      </div>
      <button onClick={rollStats} className="roll-button">
        Roll Stats
      </button>
    </div>
  );
};

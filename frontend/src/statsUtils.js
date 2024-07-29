// statsUtils.js

export const rollStats = () => {
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
  return newStats;
};

export const checkStats = (stats) => {
  const onesCount = stats.filter((stat) => stat === 1).length;
  const foursCount = stats.filter((stat) => stat === 4).length;

  return onesCount <= 1 && foursCount <= 1;
};

const skillsByStat = {
  Brawn: ["Atletyka", "Odporność", "Bijatyka", "Broń Dwuręczna", "Łucznictwo"],
  Agility: ["Machlojki", "Koordynacja", "Broń Lekka", "Rewolwery", "Rzucanie", "Karabiny"],
  Intellect: ["Astronawigacja", "Geografia", "Wycena", "Natura", "Alchemia", "Medycyna", "Artyleria"],
  Cunning: ["Pierwsza Pomoc", "Piśmienność", "Ukrywanie", "Orientacja", "Przeszukiwanie", "Oszustwo"],
  Willpower: ["Czujność", "Opanowanie", "Przymuszenie"],
  Presence: ["Mity", "Urok", "Dowodzenie", "Negocjacje", "Języki Obce"]
};

const statNames = ["Brawn", "Agility", "Intellect", "Cunning", "Willpower", "Presence"];

export const rollSkills = (stats) => {
  const skillValueDistribution = {
    1: 20,
    2: 35,
    3: 30,
    4: 14,
    5: 1
  };

  const rollSkillValue = () => {
    const rand = Math.random() * 100;
    let accumulatedPercent = 0;
    for (const [value, percent] of Object.entries(skillValueDistribution)) {
      accumulatedPercent += percent;
      if (rand <= accumulatedPercent) {
        return parseInt(value);
      }
    }
    return 0;
  };

  let skills = {};

  stats.forEach((statValue, index) => {
    const statName = statNames[index];
    const availableSkills = [...skillsByStat[statName]];
    let statSkills = [];

    for (let i = 0; i < statValue; i++) {
      if (availableSkills.length === 0) break;
      const skillIndex = Math.floor(Math.random() * availableSkills.length);
      const skillName = availableSkills.splice(skillIndex, 1)[0];
      const skillValue = rollSkillValue();
      statSkills.push({ name: skillName, value: skillValue });
    }

    skills[statName] = { statValue, skills: statSkills };
  });

  return skills;
};
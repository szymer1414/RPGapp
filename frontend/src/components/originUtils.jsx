// originUtils.jsx

import React from "react";
import axios from "axios";

export const rollCountry = async () => {
  try {
    const response = await axios.get("http://localhost:8081/roll-country");
    return response.data;
  } catch (error) {
    console.error("Error rolling country:", error);
    throw error;
  }
};

export const rollNameAndSurname = async (countryId) => {
  try {
    const response = await axios.get("http://localhost:8081/roll-name", { params: { countryId } });
    return response.data;
  } catch (error) {
    console.error("Error rolling name and surname:", error);
    throw error;
  }
};

export const OriginSection = ({ rolledCountry, rolledName, rolledSurname, onRollCountry }) => {
  return (
    <div>
      <div className="country-result">
        <strong>Rolled Country:</strong> {rolledCountry ? rolledCountry.name : ""} (ID: {rolledCountry ? rolledCountry.id : ""})
      </div>
      <div className="name-result">
        <strong>Rolled Name:</strong> {rolledName ? rolledName.name : ""} (ID: {rolledName ? rolledName.id : ""}) {rolledSurname ? rolledSurname.surname : ""} (ID: {rolledSurname ? rolledSurname.id : ""})
      </div>
      <button onClick={onRollCountry} className="roll-button">
        Roll Country
      </button>
    </div>
  );
};

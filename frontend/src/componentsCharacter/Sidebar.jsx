// Sidebar.jsx
import React from 'react';
import { useParams, Link } from 'react-router-dom';

const Sidebar = () => {
  const { id } = useParams(); // Use the character ID to navigate between routes

  return (
    <div className="sidebar">
      <li><Link to={`/character/${id}`}>Character Info</Link></li>
      <li><Link to={`/character/${id}/change-data`}>Change Data</Link></li>
      <li><Link to={`/character/${id}/change-stats`}>Change Stats</Link></li>
      <li><Link to="/characters">Back to Character List</Link></li>
    </div>
  );
};

export default Sidebar;

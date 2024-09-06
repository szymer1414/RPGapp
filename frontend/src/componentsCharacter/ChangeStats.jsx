// ChangeStats.jsx
import React from 'react';
import { useParams, Link } from 'react-router-dom';

const ChangeStats = () => {
  const { id } = useParams(); // Get the character ID from the route parameters

  return (
    <div>
      <h1>Change Stats</h1>
      {/* Form for changing stats */}
      <Link to={`/character/${id}`}>Back to Character Detail</Link> {/* Link to character detail page */}
    </div>
  );
};

export default ChangeStats;

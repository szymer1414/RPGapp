// CharacterDetail.jsx
import React from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from './Sidebar';

const CharacterDetail = () => {
  return (
    <div className="character-detail-container">
      <Sidebar />
      <div className="character-detail-content">
        <Outlet /> {/* This will render the child components like CharacterInfo, ChangeData, ChangeStats */}
      </div>
    </div>
  );
};

export default CharacterDetail;

import React from "react";
import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import Home from "./Home";
import CharacterList from "./CharacterList";
import CharacterDetail from "./CharacterDetail";

import './App.css';
const App = () => {
  return (
    <Router>
      <div className="App">
        <nav className="topbar">
          <Link to="/">Home</Link>
          <Link to="/characters">Characters</Link>
        </nav>
        <div className="content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/characters" element={<CharacterList />} />
          <Route path="/character/:id/*" element={<CharacterDetail />} />
        </Routes>
        </div>
      </div>
    </Router>
  );
};

export default App;

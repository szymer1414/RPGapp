import React from "react";
import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import Home from "./Home";
import CharacterList from "./CharacterList";
import CharacterDetail from "./CharacterDetail";

const App = () => {
  return (
    <Router>
      <div className="App">
        <nav>
          <Link to="/">Homee</Link><br></br>
          <Link to="/characters">Characters</Link>
        </nav>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/characters" element={<CharacterList />} />
          <Route path="/character/:id" element={<CharacterDetail />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;

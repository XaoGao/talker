import React, { useState } from "react";
import Cell from './cell';
import "./border.css";

const Border = () => {
  const [turn, setTurn] = useState('x')
  const [cells, setCells] = useState(Array(9).fill(''))
  const handleClick = (value) => {
    if(cells[value] !== '') {
      alert('!')
      return;
    }
    let newCells = [...cells]
    if(turn === 'x') {
      newCells[value] = 'x'
      setTurn('o')
    } else {
      newCells[value] = 'o'
      setTurn('x')
    }
    setCells(newCells)
  }
  return (
    <div className="border-container">
      <table>
        Turn: {turn}
        <tbody>
          <tr>
            <Cell handleClick={handleClick} value={0} cells={cells} />
            <Cell handleClick={handleClick} value={1} cells={cells} />
            <Cell handleClick={handleClick} value={2} cells={cells} />
          </tr>
          <tr>
            <Cell handleClick={handleClick} value={3} cells={cells} />
            <Cell handleClick={handleClick} value={4} cells={cells} />
            <Cell handleClick={handleClick} value={5} cells={cells} />
          </tr>
          <tr>
            <Cell handleClick={handleClick} value={6} cells={cells} />
            <Cell handleClick={handleClick} value={7} cells={cells} />
            <Cell handleClick={handleClick} value={8} cells={cells} />
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default Border;

import React from "react";
import "./border.css";
import Row from './Row';

const Border = ({winner, handleClick, resetBoard, turn, cells}) => {
  return (
    <div className="">
      <div className="d-flex justify-content-between">
        <div className="">Ход: {turn}</div>
        <div className="">
          {winner && (
            <p>Пебедитель {winner}</p>
          )}
        </div>
        <button onClick={resetBoard} className="btn btn-primary">{winner ? 'Сыграть опять' : 'Сбросить'}</button>
      </div>
      <div className="border-container">
        <table>
          <tbody>
            <Row handleClick={handleClick} value={0} cells={cells}/>
            <Row handleClick={handleClick} value={3} cells={cells}/>
            <Row handleClick={handleClick} value={6} cells={cells}/>
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Border;

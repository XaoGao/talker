import React from "react";
import "./border.css";
import Row from './Row';

const Border = ({handleClick, resetBoard, turn, cells}) => {
  return (
    <div className="border-container">
      <table>
        <div className="d-flex justify-content-between">
          <div className="">Ход: {turn}</div>
          <button onClick={resetBoard} className="btn btn-primary">Сбросить</button>
        </div>
        <tbody>
          <Row handleClick={handleClick} value={0} cells={cells}/>
          <Row handleClick={handleClick} value={3} cells={cells}/>
          <Row handleClick={handleClick} value={6} cells={cells}/>
        </tbody>
      </table>
    </div>
  );
};

export default Border;

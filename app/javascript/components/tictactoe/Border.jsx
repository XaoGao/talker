import React from "react";
import "./border.css";
import Row from './Row';
import { Link } from 'react-router-dom';

const Border = ({winner, handleClick, resetBoard, turn, cells}) => {
  return (
    <div>
      <div className="d-flex justify-content-between">
        <div>{i18n.t('games.tic_tac_toe.trun')}: {turn}</div>
        <div>
          {winner && (
            <p>{i18n.t('games.tic_tac_toe.winner')}: {winner}</p>
          )}
        </div>
      <div className="btn-group" role="group">
        <button onClick={resetBoard} className="btn btn-primary">{winner ? i18n.t('games.tic_tac_toe.play_again') : i18n.t('games.tic_tac_toe.reset')}</button>
        <button className="btn btn-primary"><Link id="back" to="/games">{i18n.t('button.back')}</Link></button>
      </div>
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

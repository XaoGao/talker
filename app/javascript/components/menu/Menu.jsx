import React from 'react'
import './menu.css';
import { Link } from 'react-router-dom';

const Menu = () => {
  return (
    <div className='text-center'>
      <h1>{i18n.t('games.index.choose_game')}</h1>
      <hr />
      <ul className="list-group">
        <li className="list-group-item game-item">
          <Link to="/games/tic-tac-toe">{i18n.t('games.menu.tic_tac_toe')}</Link>
        </li>
      </ul>
    </div>
  )
}

export default Menu

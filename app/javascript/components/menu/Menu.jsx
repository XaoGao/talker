import React from 'react'
import './menu.css';
import { Link } from 'react-router-dom';

const Menu = () => {
  return (
    <div className='text-center'>
      <h1>Выбирите игру</h1>
      <hr />
      <ul className="list-group">
        <li className="list-group-item game-item">
          <Link to="/games/tic-tac-toe">Крестики нолики</Link>
        </li>
      </ul>
    </div>
  )
}

export default Menu

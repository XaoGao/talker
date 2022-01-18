import React from 'react'
import { Route, Routes } from 'react-router-dom';
import Menu from '../menu/Menu';
import TickTacToe from '../tictactoe/TickTacToe';

const Router = () => {
  return (
    <div>
      <Routes>
        <Route path="/games" element={<Menu />} />
        <Route path="/games/tic-tac-toe" element={<TickTacToe />} />
      </Routes>
    </div>
  )
}

export default Router

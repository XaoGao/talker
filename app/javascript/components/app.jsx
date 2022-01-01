import React from 'react'
import TickTacToe from './tictactoe/TickTacToe'
import { Provider } from "react-redux";
import store from '../components/redux/redux-store';

const App = () => {
  return (
    <Provider store={store}>
      <TickTacToe />
    </Provider>
  )
}

export default App;
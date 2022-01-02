import React from 'react'
import { Provider } from 'react-redux';
import store from '../components/redux/redux-store';
import Router from './untils/Router';

const App = () => {
  return (
    <Provider store={store}>
      <Router />
    </Provider>
  )
}

export default App;
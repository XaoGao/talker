import React, { useEffect } from 'react'
import { Provider } from 'react-redux';
import store from '../components/redux/redux-store';
import Router from './untils/Router';

const App = () => {
  useEffect(() => {
    i18n.locale = locale;
  }, [])
  return (
    <Provider store={store}>
      <Router />
    </Provider>
  )
}

export default App;
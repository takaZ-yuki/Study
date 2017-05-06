import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';

const reducer = function (state = {count: 1}, action) {
  switch (action.type) {
    case 'INCREMENT':
      return {
        count: state.count+1
      };
    default:
      return state;
  }
};
const store = createStore(reducer);

import App from './App.jsx';

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
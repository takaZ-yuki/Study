import './index.css';

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import App from './App';
import Counter from "./counter/Container";
import Hello from './Hello';
import {Provider} from "react-redux";
import store from "./Store";

ReactDOM.render(
  <App />,
  document.getElementById('root') as HTMLElement
);

ReactDOM.render(
  <Hello compiler="TypeScript" framework="React" />,
  document.querySelector('#hello') as HTMLElement
);

ReactDOM.render(
  <Provider store={store}>
    <Counter />
  </Provider>
  , document.getElementById('app')
);
import './index.css';

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import App from './App';
import Hello from './Hello';

ReactDOM.render(
  <App />,
  document.getElementById('root') as HTMLElement
);

ReactDOM.render(
  <Hello compiler="TypeScript" framework="React" />,
  document.querySelector('#hello') as HTMLElement
);

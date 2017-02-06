import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import Sample from './Sample';
import JquerySample from './jquery_sample';
import CommentBox from './CommentBox';
import './index.css';

ReactDOM.render(
  <App/>, document.getElementById('root'));

ReactDOM.render(
  <Sample/>, document.querySelector('#Sample'));

ReactDOM.render(
  <JquerySample/>, document.querySelector('#jquerySample'));

ReactDOM.render(
  <CommentBox url="http://localhost:3001/api/comments" pollInterval={2000}/>, document.querySelector('#comment'));

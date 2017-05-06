import React from 'react';
import { connect } from 'react-redux';

let App = ({ count, onIncrementClick }) => {
  return (
    <div>
      <span>{count}</span>
      <button onClick={() => { onIncrementClick(); }}>
        inc
      </button>
    </div>
  );
};

export default connect(
  state => {
    return { count: state.count };
  },
  dispatch => {
    return {
      onIncrementClick: () => {
        dispatch({ type: 'INCREMENT' });
      }
    };
  }
)(App);
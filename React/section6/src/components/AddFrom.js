import {changeAge, changeName} from '../actions';

import React from 'react';

const AddForm = ({ store }) => {
  const {name, age} = store.getState().form;    // storeからフォームの内容を取得
  
  return (
    <div>
      <form>
        <label>
          名前：
          <input value={name} onChange={e => store.dispatch(changeName(e.target.value))} />
        </label>
        <label>
          年齢：
          <input type={age} onChange={e => store.dispatch(changeAge(e.target.value))}/>
        </label>
        <button type="submit">submit</button>
      </form>
    </div>
  );
}

import {CHANGE_AGE, CHANGE_NAME, INITIALIZE_FORM} from './actions'

import { combineReducers } from 'redux';

const initialState = {
  from: {  // AddFormに入力されている文字列
    name: '',
    age: ''
  },
  characters: {
    isFetching: false,  // サーバーからキャラクターのリストを取ってきている最中かどうか
    characterArray: []  // キャラクターのデータを入れるArray
  }
}

const formReducer = (state = initialState.from, action) => {
  switch (action.type) {
    case CHANGE_NAME:
      return {
        ...state,
        name: action.name   // actionのnameプロパティに入力された名前を入れることにする
      }
    case CHANGE_AGE:
      return {
        ...state,
        name: action.age    // nameと同様
      }
    case INITIALIZE_FORM:
      return initialState.from;   // 初期状態を返す
    default:
      return state;
  }
}

const charactersReducer = (state = initialState.characters, action) => {
  switch (action.type) {
    default:
      return state;
  }
}

const rootReducer = combineReducers({
  form: formReducer,
  characters: charactersReducer
});

export default rootReducer;
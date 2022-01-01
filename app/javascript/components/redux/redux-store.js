import { createStore, combineReducers, applyMiddleware } from "redux";
import thunkMiddleware from "redux-thunk";
import ticTacToeReducer from "./ticTacToeReducer";

let reducers = combineReducers({
  ticTacToe: ticTacToeReducer
})

let store = createStore(reducers, applyMiddleware(thunkMiddleware));

export default store;

import { gamesApi } from '../api/gamesApi'

const SET_TURN = "ticTacToe/SET_TURN";
const SET_CELLS = "ticTacToe/SET_CELLS";
const SET_WINNER = "ticTacToe/SET_WINNER";

let initState = {
  turn: "X",
  cells: Array(9).fill(""),
  winner: undefined,
};

const ticTacToeReducer = (state = initState, action) => {
  switch (action.type) {
    case SET_TURN:
      return {
        ...state,
        turn: action.turn,
      };
    case SET_CELLS:
      return {
        ...state,
        cells: action.cells,
      };
    case SET_WINNER:
      return {
        ...state,
        winner: action.winner,
      };
    default:
      return state;
  }
};

export default ticTacToeReducer;

export const setTurn = (turn) => ({
  type: SET_TURN,
  turn: turn,
});
export const setCells = (cells) => ({
  type: SET_CELLS,
  cells: cells,
});
export const setWinner = (winner) => ({
  type: SET_WINNER,
  winner: winner,
});

export const reset = (dispatch) => {
  dispatch(setTurn("X"));
  dispatch(setCells(Array(9).fill("")));
  dispatch(setWinner(undefined));
};

export const move = (number, cells, turn) => async (dispatch) => {
  return await gamesApi
    .move(number, turn, cells)
    .then((response) => {
      if (response.status === 200) {
        if (response.data.data) {
          dispatch(setTurn(response.data.data.turn))
          dispatch(setCells(response.data.data.cells))
          dispatch(setWinner(response.data.data.winner))
        }
      }
    })
    .catch((error) => {
      // let err = error.response.data.error
      return error
    })
}

// const checkWinner = (dispatch, newCells) => {
//   for (let combo in combos) {
//     combos[combo].forEach((pattern) => {
//       if (
//         newCells[pattern[0]] !== "" &&
//         newCells[pattern[1]] !== "" &&
//         newCells[pattern[2]] !== ""
//       ) {
//         if (
//           newCells[pattern[0]] === newCells[pattern[1]] &&
//           newCells[pattern[1]] === newCells[pattern[2]]
//         ) {
//           dispatch(setWinner([newCells[pattern[0]]]));
//         }
//       }
//     });
//   }
// };

// const combos = {
//   across: [
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8],
//   ],
//   down: [
//     [0, 3, 6],
//     [1, 4, 7],
//     [2, 5, 8],
//   ],
//   diagnol: [
//     [0, 4, 8],
//     [2, 4, 6],
//   ]
// }

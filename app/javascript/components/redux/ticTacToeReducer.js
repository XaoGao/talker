const SET_CHECK = "ticTacToe/SET_CHECK"

let initState = {
  check: false
}

const ticTacToeReducer = (state = initState, action) => {
  switch (action.type) {
    case SET_CHECK:
      return {
        ...state,
        check: action.check
      }
    default:
      return state;
  }
};

export default ticTacToeReducer;

export const setCheck = (check) => ({
  type: SET_CHECK,
  check: check
})
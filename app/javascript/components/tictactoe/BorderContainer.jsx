import React from 'react'
import { connect, useDispatch } from 'react-redux'
import Border from './Border'
import { reset, move } from '../redux/ticTacToeReducer';

const BorderContainer = (props) => {
  const dispatch = useDispatch()

  const resetBoard = () => {
    reset(dispatch)
  }

  const handleClick = async (value) => {
    await props.move(value, props.cells, props.turn).catch((error) => {
      toastr.error(error.message);
    })
  }

  return (
    <Border 
      winner={props.winner} 
      turn={props.turn} 
      cells={props.cells} 
      resetBoard={resetBoard} 
      handleClick={handleClick} 
    />
  )
}

const mapStateToProps = (state) => {
  return {
    turn: state.ticTacToe.turn,
    cells: state.ticTacToe.cells,
    winner: state.ticTacToe.winner
  }
}

export default connect(mapStateToProps, { move })(BorderContainer);

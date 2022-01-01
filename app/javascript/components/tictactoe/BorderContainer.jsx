import React, { useState } from 'react'
import { connect } from 'react-redux'
import Border from './Border'

const BorderContainer = (props) => {
  const [turn, setTurn] = useState('X')
  const [cells, setCells] = useState(Array(9).fill(''))
  const [winner, setWinner] = useState()

  const resetBoard = () => {
    setCells(Array(9).fill(''))
    setTurn('X')
    setWinner();
  }

  const handleClick = (value) => {
    if(cells[value] !== '') {
      alert('!')
      return;
    }
    let newCells = [...cells]
    if(turn === 'X') {
      newCells[value] = 'X'
      setTurn('O')
    } else {
      newCells[value] = 'O'
      setTurn('X')
    }
    checkWinner(newCells)
    setCells(newCells)
  }

  const checkWinner = (newCells) => {
    let combos = {
        across: [
          [0,1,2],
          [3,4,5],
          [6,7,8]
        ],
        down: [
          [0,3,6],
          [1,4,7],
          [2,5,8]
        ],
        diagnol: [
          [0,4,8],
          [2,4,6]
        ]
    }
    for(let combo in combos) {
      combos[combo].forEach((pattern) => {
        if (newCells[pattern[0]] !== '' &&
            newCells[pattern[1]] !== '' &&
            newCells[pattern[2]] !== '') {
          if(newCells[pattern[0]] === newCells[pattern[1]] &&
            newCells[pattern[1]] === newCells[pattern[2]]) {
            setWinner([newCells[pattern[0]]])
          }
        }
      });
    }
  }

  return (
    <Border check={props.check}  winner={winner} resetBoard={resetBoard} handleClick={handleClick} turn={turn} cells={cells}/>
  )
}

const mapStateToProps = (state) => {
  return {
    // check: state.ticTacToe.check
  }
}

export default connect(mapStateToProps, {})(BorderContainer);

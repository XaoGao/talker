import React, { useState } from 'react'
import Border from './Border'

const BorderContainer = () => {
  const [turn, setTurn] = useState('X')
  const [cells, setCells] = useState(Array(9).fill(''))

  const resetBoard = () => {
    setCells(Array(9).fill(''))
    setTurn('X')
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
    setCells(newCells)
  }
  return (
    <Border resetBoard={resetBoard} handleClick={handleClick} turn={turn} cells={cells}/>
  )
}

export default BorderContainer

import React from 'react'
import Cell from './Cell';

const Row = ({handleClick, value, cells}) => {
  return (
    <tr>
      <Cell handleClick={handleClick} value={value} cells={cells} />
      <Cell handleClick={handleClick} value={value + 1} cells={cells} />
      <Cell handleClick={handleClick} value={value + 2} cells={cells} />
    </tr>
  )
}

export default Row

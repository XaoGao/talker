import React from 'react'

const Cell = ({ handleClick, value, cells }) => {
  return (
    <td className='text-center' onClick={()=>handleClick(value)}>{cells[value]}</td>
  )
}

export default Cell

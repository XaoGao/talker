import React from 'react'

const Cell = (props) => {
  return (
    <td className='text-center' onClick={()=>props.handleClick(props.value)}>{props.cells[props.value]}</td>
  )
}

export default Cell

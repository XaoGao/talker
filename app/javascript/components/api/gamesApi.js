import * as axios from "axios";

const baseUrl = "http://localhost:3000";

export const gamesApi = {
  move(number, turn, cells) {
    const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
    const requester = axios.create({
      baseURL: `${baseUrl}`,
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf
      }
    })
    return requester
      .post("games/move", { current_cell: number, current_turn: turn, cells: cells })
      .then((response) => {
        return response;
      })
  }
}
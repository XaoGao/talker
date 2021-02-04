import consumer from "./consumer";
import { scrollToBotton, appendMessage } from "../extension/chat";

let connected = false;

$(document).on("turbolinks:load", function () {
  if (document.getElementById("dialog-id") && !connected) {
    let dialogIdEl = document.getElementById("dialog-id");
    const dialog_id = Number(dialogIdEl.getAttribute("dialog-id"));
    consumer.subscriptions.create(
      { channel: "RoomChannel", dialog_id: dialog_id },
      {
        connected() {
          scrollToBotton();
          connected = true;
        },

        disconnected() {
          connected = false;
        },

        received(data) {
          appendMessage(data.content);
          scrollToBotton();
        },
      }
    );
  }
});

import consumer from "./consumer";
import { scrollToBotton, appendMessage } from "../extension/chat";

$(document).on("turbolinks:load", function () {
  if (document.getElementById("dialog-id")) {
    let dialogIdEl = document.getElementById("dialog-id");
    const dialog_id = Number(dialogIdEl.getAttribute("dialog-id"));
    consumer.subscriptions.create(
      { channel: "RoomChannel", dialog_id: dialog_id },
      {
        connected() {
          scrollToBotton();
          // Called when the subscription is ready for use on the server
        },

        disconnected() {
          // Called when the subscription has been terminated by the server
        },

        received(data) {
          appendMessage(data.content);
          scrollToBotton();
        },
      }
    );
  }
});

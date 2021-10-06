import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("NotificationsChannel ready")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    toastr.info("message")
  }
});

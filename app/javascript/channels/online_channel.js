import consumer from "./consumer"

consumer.subscriptions.create("OnlineChannel", {
  connected() {
    // console.log('online');
  },

  disconnected() {
    // console.log('disconncet');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});

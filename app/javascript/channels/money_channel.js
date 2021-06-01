import consumer from "./consumer"

$(document).on("turbolinks:load", function () {
  if (document.getElementById("money")) {
    consumer.subscriptions.create("MoneyChannel", {
      connected() {
      },
    
      disconnected() {
      },
    
      received(data) {
        var el = document.getElementById("money");
        if (el && data.content.USD) {
          el.innerHTML="USD: " + data.content.USD;
        }
      }
    });
  }
});


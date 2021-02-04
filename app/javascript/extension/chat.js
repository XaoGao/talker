export const scrollToBotton = () => {
  let el = $(".chat-box");
  if (el.length > 0) {
    el.scrollTop($(".chat-box")[0].scrollHeight);
  }
};
export const appendMessage = (message) => {
  let messages = $("#messages");
  if (messages.length > 0) {
    messages.append(message);
  } else {
    console.log("error");
  }
  let field = $("#message-body-field");
  if (field.length > 0) {
    field.val("");
  }
};

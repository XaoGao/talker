export const infiniteScrolling = () => {
  if ($("#infinite-scrolling").length > 0) {
    if (
      $(window).on("scroll", function () {
        if (
          $(window).scrollTop() + $(window).height() ==
          $(document).height()
        ) {
          let url = $(".pagination .next_page").attr("href");
          if (url) {
            $.getScript(url);
          }
        }
      })
    );
  }
};
export const infiniteScrollingMessages = () => {
  if ($("#infinite-scrolling-messages").length > 0) {
    if ($('.chat-box').on("scroll", function () {
        if ($('.chat-box').scrollTop() == 0) {
          let url = $(".pagination .next_page").attr("href");
          if (url) {
            $.getScript(url);
          }
        }
      })
    );
  }
};

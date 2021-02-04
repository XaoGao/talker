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

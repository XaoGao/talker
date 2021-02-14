$(function () {
  $(document).on("click", ".comments-for-ajax", function () {
    var id = $(this).attr("commentableid");
    var type = $(this).attr("commentabletype");
    var count = Number($("#" + type + "-" + id + "-comments-count").text());
    if (count > 0) {
      $.ajax({
        url: "/comments/",
        method: "GET",
        data: { id: id, type: type },
        success: function () {},
      });
    }
  });
});

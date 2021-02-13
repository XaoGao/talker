$(function () {
  $(document).on("click", ".comments-for-ajax", function () {
    var id = $(this).parent().attr("id");
    var type = $(this).parent().attr("type");
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

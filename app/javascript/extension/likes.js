$(function() {
  $(document).on("click", ".likes-for-ajax", function(){
    var id = $(this).parent().attr("id");
    var type = $(this).parent().attr("type");
    $.ajax({
      url: "/likes/",
      method: "POST",
      data: { id: id, type: type },
      success: function() {

      }
    })
  });
});

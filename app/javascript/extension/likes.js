$(function() {
  $(document).on("click", ".likes-for-ajax", function(){
    var id = $(this).attr("likeableid");
    var type = $(this).attr("likeabletype");
    $.ajax({
      url: "/likes/",
      method: "POST",
      data: { id: id, type: type },
      success: function() {

      }
    })
  });
});

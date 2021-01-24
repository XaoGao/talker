require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application';

let showArticleForm = function() {
  $('#article-form-field').on("click", function() {
    $('#article-form-field').hide();
    $('#article-form').show();
  });
}

let infiniteScrolling = function() {
  if ($('#infinite-scrolling').length > 0) {
    if ($(window).on('scroll', function() {
      if($(window).scrollTop() + $(window).height() == $(document).height()) {
        let url = $('.pagination .next_page').attr('href')
        if (url) {
          $.getScript(url);
        }
    }}));
  }
}


$(document).on('turbolinks:load', function(){
  showArticleForm();
  infiniteScrolling();
})
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application';
import { scrollToBotton } from '../extension/chat';
import { infiniteScrolling } from '../extension/scroll';
import '../extension/likes';
import '../extension/comments';

let showArticleForm = function() {
  $('#article-form-field').on("click", function() {
    $('#article-form-field').hide();
    $('#article-form').show();
  });
}

let commentSubmit = function() {
  $('#comment-form-').on("click", function() {
    $('#comment-form-').trigger( "submit" );
  });
}

$(document).on('turbolinks:load', function(){
  showArticleForm();
  infiniteScrolling();
  scrollToBotton();
})
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application';
import { scrollToBotton } from '../extension/chat';
import { changeStatus } from '../extension/status';
import { infiniteScrolling, infiniteScrollingMessages } from '../extension/scroll';
import '../extension/likes';
import '../extension/comments';

let showForm = function() {
  $('#article-form-field').on("click", function() {
    $('#article-form-field').hide();
    $('#article-form').show();
  });

  $('#picture-form-field').on("click", function() {
    $('#picture-form-field').hide();
    $('#picture-form').show();
  });
}

let disableSubmit = function() {
  if ($('#picture-from-file-field').files.length > 0) {
    $('#picture-form-submit').attr("disabled", true);
  } else {
    $('#picture-form-submit').attr("disabled", false);
  }
}

let commentSubmit = function() {
  $('#comment-form-').on("click", function() {
    $('#comment-form-').trigger( "submit" );
  });
}

$(document).on('turbolinks:load', function(){
  showForm();
  infiniteScrolling();
  scrollToBotton();
  infiniteScrollingMessages();
  changeStatus();
  disableSubmit();
})
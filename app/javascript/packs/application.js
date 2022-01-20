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
import toastr from 'toastr';
import { I18n } from 'i18n-js';
import translations from "../locales.json";

const i18n = new I18n(translations);
i18n.defaultLocale = "en";

toastr.options = {
    "closeButton": true
};

global.toastr = toastr;
global.i18n = i18n;

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
  if ($('#picture-form-file-field').length > 0) {
    if ($('#picture-form-file-field').files.length > 0) {
      $('#picture-form-submit').attr("disabled", false);
    } else {
      $('#picture-form-submit').attr("disabled", true);
    }
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
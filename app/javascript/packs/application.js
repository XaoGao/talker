require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application'

$(document).on('turbolinks:load', function(){
  $('#article-form-field').on("click", function() {
    $('#article-form-field').hide();
    $('#article-form').show();
  })
})
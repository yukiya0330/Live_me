// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "./slick"
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(function(){
  $('.alert').fadeOut(4000);  //４秒かけて消えていく
});

$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    // 自動再生
    autoplay:true,
    // ドットの表示
    dots:true
  });
});
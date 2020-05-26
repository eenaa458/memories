// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require moment 
//= require jquery.slick
//= require fullcalendar
//= require fullcalendar/locale-all
//= require_tree .


$(function() {
  $('.a').slick({
    dots: true,
    infinite: true,
    prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
  });
});
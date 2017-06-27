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
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require materialize
//= require jt_address
//= require_tree .

$( document ).ready(function(){
   $(".button-collapse").sideNav();
   console.log($('select'))
   $('select').material_select();
   
})

// This function is call when Google Maps is loaded
window.googleMapInitialize = function(){

    // Simple usage
    $('.jt-address-autocomplete').jt_address();
    
    // Advanced usage with google options
    $('.jt-address-autocomplete').jt_address({
        type: ['restaurant'],
        componentRestrictions: { country: 'fr' }
    });

};
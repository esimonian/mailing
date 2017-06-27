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

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  // grap our upload form by its id
  $(".dropzone").dropzone({
    // restrict image size to a maximum 1MB
    maxFilesize: 1,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "template[image]",
    // show remove links on each image upload
    addRemoveLinks: true,
    // if the upload was successful
    success: function(file, response){
      // find the remove button link of the uploaded file and give it an id
      // based of the fileID response from the server
      $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
      // add the dz-success class (the green tick sign)
      $(file.previewElement).addClass("dz-success");
    },
    //when the remove button is clicked
    removedfile: function(file){
      // grap the id of the uploaded file we set earlier
      var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

      // make a DELETE ajax request to delete the file
      $.ajax({
        type: 'DELETE',
        url: '/templates/' + id,
        success: function(data){
          console.log(data.message);
        }
      });
    }
  }); 
});

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
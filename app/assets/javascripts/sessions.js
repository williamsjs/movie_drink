 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

 $(function() {
   $("#modal-1").on("change", function() {
     if ($(this).is(":checked")) {
       $("body").addClass("modal-open");
     } else {
       $("body").removeClass("modal-open");
     }
   });

   $(".modal-window").on("click", function() {
     $(".modal-state:checked").prop("checked", false).change();
   });

   $(".modal-inner").on("click", function(e) {
     e.stopPropagation();
   });
 });

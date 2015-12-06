$(document).ready(function() {

  // **************** responsive nav **************** //
  $("#nav-mobile").html($("#nav-main").html());
  
  $("#nav-trigger span").on("click", function(){
    if ($("nav#nav-mobile ul").hasClass("expanded")) {
      $("nav#nav-mobile ul.expanded").removeClass("expanded").slideUp();
      $(this).removeClass("open");
    } else {
      $("nav#nav-mobile ul").addClass("expanded").slideDown();
      $(this).addClass("open");
    }
  });
});

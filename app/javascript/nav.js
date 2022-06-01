document.addEventListener("turbolinks:load", function() {
$(function () {
  $('.nav-trigger').on('click', function () {
    $('.header-nav-menu').toggle();
  })
});
})

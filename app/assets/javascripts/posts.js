// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(function() {
  var posts = $('.post');
  var first = posts[0];
  $(first).show();

  $(".yes-post").click(function(event) {
    event.preventDefault();
    var button = this;
    var post = $(button).parents('.post');

      $.ajax('/matches', {
        type: "POST",
        data: {
        post_id: first.id,
        approved: true
        },
        success: function() {
          hideProfileOrPost(post);
          // given an array of posts, find the index of the current One
          // show next post by index
          var index = $(posts).index(post);
          $(posts[index+1]).show();
        }
    });
  });

   function hideProfileOrPost(post) {
     $(post).hide();
  }
});

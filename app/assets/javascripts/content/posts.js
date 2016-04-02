$(document).ready(function(){
   $('.show-comment').on("click", function(){
      $(this).addClass('.hidden').hide();
      $(this).siblings('.comment-form').removeClass('hidden').fadeIn("slow");
      $(this).siblings('.hide-comment-form').removeClass('hidden').fadeIn("slow");
   });
   $('.hide-comment-form').on("click", function(){
      $(this).addClass('hidden');
      $(this).siblings('.comment-form').addClass('hidden');
      $(this).siblings('.show-comment').fadeIn("slow");
   });

   $('.hide-chain').on("click", function(){
      $(this).hide();
      $(this).siblings('.show-comment-chain').removeClass('hidden').show();
      $(this).parent().children('.sub-comm').addClass('hidden').fadeOut("slow");
   });

   $('.show-comment-chain').on("click", function(){
      $(this).hide();
      $(this).siblings('.hide-chain').removeClass('hidden').show();
      $(this).parent().children('.sub-comm').removeClass('hidden');
   });
});

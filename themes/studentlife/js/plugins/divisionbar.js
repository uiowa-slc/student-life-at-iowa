$(document).ready(function(){
  $('.division-directory').hide();

  $('.directory-toggle').click(function(){
    $(this).toggleClass("active");
    $('.division-directory').slideToggle();
    return false;
  });
  $('.search-toggle').click(function(){
    $(this).toggleClass('active');
    $('.division-search').slideToggle();
    return false;
  });
  $('.division-menu').on('click','.has-subnav a',function(){
    $(this).next().slideToggle('slow');$(this).toggleClass('active');
});
});
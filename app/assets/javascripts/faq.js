$(document).ready(function() {
  // 상세보기
  $('div.faq_wrapper > ul.list > li').click(function() {
    $(this).find('span.detail').toggleClass('show');
    $(this).find('span.pointer').toggleClass('down');
  });

});
function posts_preview() {
  $('.tabular.menu .item').tab();

  $('a[data-tab=preview]').on('click', function(){

    var post_content = $('#post_content').val();
    $.ajax({
      method: "POST",
      url: "/posts/preview.json",
      dataType: "text",
      data: {content: post_content}
    })
      .done(function(data) {
        $('#preview').html(data);
      });
  });
}

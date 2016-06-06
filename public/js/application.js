$(document).ready(function() {
  $('.create-restaurant').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr('href')
    }).done(function(response){
      $(event.target).hide();
      $('.new-restaurant-form-container').html(response);
    });
  });

$('.new-restaurant-form-container').on('submit', '.new-restaurant-form', function(event){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr('action'),
    method: $(event.target).attr('method'),
    data: $(event.target).serialize()
  }).done(function(response){
    $('.new-restaurant-form').hide();
    $('.create-restaurant').show();
    $('.restaurants-list').prepend(response);
  });
});


$('.restaurant-edit-link').on('click', function(event){
  event.preventDefault();
  $.ajax({
    url:$(event.target).attr('href')
  }).done(function(response){
    $(event.target).hide();
    $('.edit-container').html(response);
  });
});

$('.edit-container').on('submit', '.restaurant-edit-form', function(event){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr('action'),
    method: $(event.target).attr('method'),
    data: $(event.target).serialize()
  }).done(function(response){
    $('.restaurant-name').html(response);
    $('.restaurant-edit-form').remove();
    $('.restaurant-edit-link').show();
  });
});

});





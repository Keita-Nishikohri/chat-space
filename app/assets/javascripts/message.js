$(function(){
  $('#message_body').submit(function(){
    console.log(this)
    var formData = new FormData(this);
  })
})
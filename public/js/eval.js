$(document).ready(function(){
  // Set event and ajax action for evaluation form
  // receive the form id as string and target url to render next page
  //  after succesfull post
  send_eval_conf = function(form, target_url){
    $(form).on("submit",function(event){
      event.preventDefault();
      console.log("inside");
      $.ajax({
        url: target_url,
        type: "POST",
        data: $(form).serialize(),
        success: function(data){
          console.log(data);
          $("#eval_cont").html(data);
        }
      })
    });
  }

  send_eval_conf("#form_eval_1", "/eval_2");
  send_eval_conf("#form_eval_2", "/eval_3");
  send_eval_conf("#form_eval_4", "/eval_5");

})
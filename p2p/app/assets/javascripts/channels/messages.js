
// Modify to apply with views

//This code received data of sockets and show whith JQuery
// Modify this code if views change 
App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
  	console.log(data)
    $("#messages").removeClass('hidden')
    return $("[data-chatroom='"+data.chatroom_id+"']").append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
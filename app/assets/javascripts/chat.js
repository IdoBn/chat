// jQuery(function() {
// 	var dispatcher = new WebSocketRails($('#chat').data('uri'), true);
// 	var private_channel = dispatcher.subscribe($('#chat').data('channel'));

// 	var messageQueue = [];

// 	private_channel.on_success = function(data) {
// 		console.log('channel success: ' + data.message);
// 	}

// 	dispatcher.on_open = function(data) {
// 		console.log('Connection has been established: ', data);
// 	}

// 	private_channel.bind('new_message', function(message) {
//     console.log('new message: ' + message.msg_body + ', ' + message.user_name + ', ' + message.received);
//     newMessage(message);
//   });

//   $('#send').bind('click', function() {
//     console.log('clicked!!');
//     sendMessage();
//   })

//   function sendMessage() {
//     message = $('#message').val();
//     user_name = $('#user_name').val();
//     dispatcher.trigger ('new_message', {user_name: user_name, msg_body: message, channel_name: $('#chat').data('channel')});
//     $('#message').val('');
//   }

//   function messageTemplate(message) {
//     return "<div class='message' ><label class='label label-info'>[" + message.received + "] " + message.user_name +"</label>&nbsp;: "+ message.msg_body +"</div>";
//   }

//   function shifMessageQueue() {
//     messageQueue.shift();
//     $('#chat div.messages:first').slideDown(100, function() {
//       $(this).remove();
//     });
//   }

//   function newMessage(message) {
//     messageQueue.push(message);
//     if (messageQueue.length > 15) {
//       shiftMessageQueue();
//     }
//     appendMessage(message);
//   }

//   function appendMessage(message) {
//     var template = messageTemplate(message);
//     $('#chat').append(template);
//     //template.slideDown(140);
//   }

// });
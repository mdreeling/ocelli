var ws = $.gracefulWebSocket("ws://127.0.0.1:9000/collect");
ws.onmessage = function(event) {
    var messageFromServer = event.data;
    $('#output').append('Received: '+messageFromServer+'');
}
 
function send(message) {
    ws.send(message);
}
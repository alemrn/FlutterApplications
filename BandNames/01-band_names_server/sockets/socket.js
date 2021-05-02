
//import io package or io module from index
const {io} = require('../index');

// Sockets messages
io.on('connection', client => {
    console.log('Connected');

  client.on('disconnect', () => {
    console.log('Client Disconnected');
  });

  client.on('message',(message)=>{
      console.log('Mensaje!!!', message);
      io.emit('message', {admin: 'New message'});
  } );
});
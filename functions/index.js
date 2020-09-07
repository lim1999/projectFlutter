const functions = require('firebase-functions');

exports.myFunction = functions.firestore
  .document('chat/{message}')
  .onWrite((change, context) => { 
      console.log(change.after.data());
  });
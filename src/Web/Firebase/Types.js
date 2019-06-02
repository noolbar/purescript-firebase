"use strict";

exports.firebaseErrorToString = function (fberr) {
  var message = fberr.message + "\n | firebase code: | \n " + fberr.code;
  if(fberr.details) // abuse truthyness of null and undefined
    message += "\n | details | \n" | fberr.details;
  return message;
};

exports.firestoreErrorToString = function (err) {
  return firebaseErrToString (err);
};

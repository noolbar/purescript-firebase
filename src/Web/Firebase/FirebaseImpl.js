'use strict';

var firebase = require("firebase/app");
require("firebase/auth");
require("firebase/firestore");


exports._initializeApp = function (firebaseConfig, opts) {
  return function () {
    return firebase.initializeApp(firebaseConfig, opts.name);
  };
};

exports._app = function (opts) {
  return function () {
    return firebase.app(opts.name);
  };
};

exports._auth = function (opts) {
  return function () {
    // console.log(app.app);
    return firebase.auth(opts.app);
  };
};

exports.githubAuthProviderImpl = new firebase.auth.GithubAuthProvider();

exports._database = function (opts) {
  return function () {
    return firebase.database(opts.app);
  };
};

exports._firestore = function (opts) {
  return function () {
    return firebase.firestore(opts.app);
  };
};

exports.firebaseRef = firebase;

exports._storage = function () {
  return function () {
    return firebase.storage();
  };
};

exports._toString = function (readable) {
  return function () {
    return readable.toString();
  }
};

exports._toJSON = function (serializable) {
  return function () {
    return serializable.toJSON();
  };
};

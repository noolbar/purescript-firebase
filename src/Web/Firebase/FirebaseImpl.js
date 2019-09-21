'use strict';

exports._initializeApp = function (firebase, firebaseConfig, opts) {
  return function () {
    return firebase.initializeApp(firebaseConfig, opts.name);
  };
};

exports._app = function (firebase, opts) {
  return function () {
    return firebase.app(opts.name);
  };
};

exports._auth = function (firebase, opts) {
  return function () {
    // console.log(app.app);
    return firebase.auth(opts.app);
  };
};

exports.githubAuthProviderImpl = function (firebase) {
  return function () {
    return new firebase.auth.GithubAuthProvider();
  }
}

exports._database = function (firebase, opts) {
  return function () {
    return firebase.database(opts.app);
  };
};

exports._firestore = function (firebase, opts) {
  return function () {
    return firebase.firestore(opts.app);
  };
};

exports._storage = function (firebase) {
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

'use strict';

// module Web.Firebase.Authentication.Eff


exports._onAuth = function (callback, firebase) {
  var cbEffect = function(data) {
    return callback(data)(); // ensure effect gets used
  };
  return function() {
    return firebase.onAuth(cbEffect);
  };
};

exports._authWithOAuthRedirect = function (provider, errorCallback, ref) {
  var errorCbEffect = function(error) {
    return errorCallback(error)(); // ensure effect gets used
  };
  ref.authWithOAuthRedirect(provider, errorCbEffect);
};

// also needs an authData parameter for success
exports._authWithCustomToken = function (token, errorCallback, ref) {
  var errorCbEffect = function(error) {
    return errorCallback(error)(); // extra () to ensure effects get used
  };
  ref.authWithCustomToken(token, errorCbEffect);
};


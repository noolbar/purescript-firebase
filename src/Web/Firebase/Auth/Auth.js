"use strict"

exports._applyActionCode = function (auth, code) {
  return function () {
    return auth.applyActionCode(code);
  };
};

exports._checkActionCode = function (auth, code) {
  return function () {
    return auth.checkActionCode(code);
  };
};

exports._confirmPasswordReset = function (auth, code, newPassword) {
  return function () {
    return auth.confirmPasswordReset(code, newPassword);
  };
};

exports._createUserWithEmailAndPassword = function (auth, email, password) {
  return function () {
    return auth.createUserWithEmailAndPassword(email, password);
  };
};

exports._fetchSignInMethodsForEmail = function (auth) {
  return function () {
    return auth.fetchSignInMethodsForEmail();
  };
};

exports._getRedirectResult = function (auth) {
  return function () {
    return auth.getRedirectResult();
  };
};

exports._isSignInWithEmailLink = function (auth, emailLink) {
  return function () {
    return auth.isSignInWithEmailLink(emailLink);
  };
};

exports._onAuthStateChanged = function (auth, next, opts) {
  return function () {
    return auth.onAuthStateChanged(next, opts.error, opts.completed);
  };
};

exports._onIdTokenChanged = function (auth, next, opts) {
  return function () {
    return auth.onIdTokenChanged(next, opts.error, opts.completed);
  };
};

exports._sendPasswordResetEmail = function (auth, email, opts) {
  return function () {
    return auth.sendPasswordResetEmail(email, opts.actionCodeSettings);
  };
};

exports._sendSignInLinkToEmail = function (auth) {
  return function () {
    auth.sendSignInLinkToEmail();
  };
};

exports._setPersistence = function (auth) {
  return function () {
    auth.setPersistence();
  };
};

exports._signInAnonymously = function (auth) {
  return function () {
    return auth.signInAnonymously();
  };
};

exports._signInWithCredential = function (auth, credential) {
  return function () {
    return auth.signInWithCredential(credential);
  };
};

exports._signInWithCustomToken = function (auth, token) {
  return function () {
    return auth.signInWithCustomToken(token);
  };
};

exports._signInWithEmailAndPassword = function (auth, opts) {
  return function () {
    return auth.signInWithEmailAndPassword(opts.email, opts.password);
  };
};

exports._signInWithEmailLink = function (auth, email, opts) {
  return function () {
    return auth.signInWithEmailLink(email, opts.emailLink);
  };
};

exports._signInWithPhoneNumber = function (auth, phoneNumber, applicationVerifier) {
  return function () {
    return auth.signInWithPhoneNumber(phoneNumber, applicationVerifier);
  };
};

exports._signInWithPopup = function (auth, provider) {
  return function () {
    return auth.signInWithPopup(provider);
  };
};

exports._signInWithRedirect = function (auth, provider) {
  return function () {
    return auth.signInWithRedirect(provider);
  };
};

// signOut returns a promise containing void, not sure we capture that correctly here
exports._signOut = function (auth) {
  return function () {
    auth.signOut();
  };
};

exports._updateCurrentUser = function (auth, user) {
  return function () {
    auth.updateCurrentUser(user);
  };
};

exports._useDeviceLanguage = function (auth) {
  return function () {
    return auth.useDeviceLanguage();
  };
};

exports._verifyPasswordResetCode = function (auth, code) {
  return function () {
    return auth.verifyPasswordResetCode(code);
  };
};

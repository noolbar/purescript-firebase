"use strict";


exports._getOptions = function (firestore) {
  return firestore.getOptions(data);
};

exports._merge = function (firestore, path) {
  return function () {
    firestore.merge(path);
  };
};

exports._mergeFields = function (firestore, path) {
  return function () {
    firestore.mergeFields(path);
  };
};

exports._setLogLevel = function (firestore, level) {
  return function () {
    firestore.setLogLevel(level);
  };
};



exports._batch = function (firestore) {
  return function () {
    return firestore.batch();
  };
};

exports._clearPersistence = function (firestore) {
  return function () {
    return firestore.clearPersistence();
  };
};

exports._collection = function (firestore, path) {
  return function () {
    return firestore.collection(path);
  };
};

exports._collectionGroup = function (firestore, collectionId) {
  return function () {
    firestore.collectionGroup(collectionId);
  };
};

exports._disableNetwork = function (firestore) {
  return function () {
    return firestore.disableNetwork();
  };
};

exports._doc = function (firestore, path) {
  return function () {
    return firestore.doc(path);
  };
};

exports._enableNetwork = function (firestore) {
  return function () {
    return firestore.enableNetwork();
  };
};

exports._enablePersistence = function (firestore, opts) {
  return function () {
    return firestore.enablePersistence(opts.settings);
  };
};

exports._runTransaction = function (firestore, updateFunction) {
  return function () {
    return firestore.runTransaction(updateFunction);
  };
};

exports._settings = function (firestore, settings) {
  return function () {
    return firestore.settings(settings);
  };
};

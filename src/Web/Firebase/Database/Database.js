'use strict';

exports._goOffline = function (database) {
  return function () {
    return database.goOffline();
  };
};

exports._goOnline = function (database) {
  return function () {
    return database.goOnline();
  };
};

exports._ref = function (database, path) {
  return function () {
    return database.ref(path);
  };
};

exports._refFromURL = function (database, url) {
  return function () {
    return database.refFromURL(url);
  };
};

exports.key = function (database) {
  return database.key;
};


exports._child = function (database, path) {
  return function () {
    return database.child(path);
  };
};

exports._endAt = function (database, value, opts) {
  return function () {
    return database.endAt(value, opts.key);
  };
};

exports._equalTo = function (database, value, opts) {
  return function () {
    return database.equalTo(value, opts.key);
  };
};

exports._isEqual = function (database, other) {
  return function () {
    return database.isEqual(other);
  };
};

exports._limitToFirst = function (database, limit) {
  return function () {
    return database.limitToFirst(limit);
  };
};

exports._limitToLast = function (database, limit) {
  return function () {
    return database.limitToLast(limit);
  };
};

exports._off = function (database, opts) {
  return function () {
    return database.off(opts.eventType, opts.callback, opts.context);
  };
};

exports._on = function (database, eventType, callback, opts) {
  return function () {
    return database.on(eventType, callback, opts.cancelCallbackOrContext, opts.context);
  };
};

exports._onDisconnect = function (database) {
  return function () {
    return database.onDisconnect();
  };
};

exports._once = function (database, eventType, opts) {
  return function () {
    return database.once(callback, opts.successCallback, opts.failureCallbackOrContext, opts.context);
  };
};

exports._orderByChild = function (database, path) {
  return function () {
    return database.orderByChild(path);
  };
};

exports._orderByKey = function (database) {
  return function () {
    return database.orderByKey();
  };
};

exports._orderByPriority = function (database) {
  return function () {
    return database.orderByPriority();
  };
};

exports._orderByValue = function (database) {
  return function () {
    return database.orderByValue();
  };
};

exports._push = function (database, opts) {
  return function () {
    return database.push(opts.value, opts.onComplete);
  };
};

exports._remove = function (database, opts) {
  return function () {
    return database.remove(opts.onComplete);
  };
};

exports._set = function (database, value, opts) {
  return function () {
    return database.set(value, opts.onComplete);
  };
};

exports._setPriority = function (database, priority, onComplete) {
  return function () {
    return database.setPriority(priority, onComplete);
  };
};

exports._setWithPriority = function (database, newVal, newPriority, opts) {
  return function () {
    return database.setWithPriority(newVal, newPriority, opts.onComplete);
  };
};
exports._startAt = function (database, value, opts) {
  return function () {
    return database.startAt(value, opts.key);
  };
};

exports._transaction = function (database, transactionUpdate, opts) {
  return function () {
    return database.transaction(transactionUpdate, opts.onComplete);
  };
};

exports._update = function (database, value, opts) {
  return function () {
    return database.update(value, opts.onComplete);
  };
};

// a quick way to get a root reference for a database from a firebase config
// trainwreck to have something close to the 2.2 firebase api for our tests and old code
exports.rootRefFor = function (database) {
  return function () {
    database.ref();
  };
};

"use strict";

exports._cancel = function (database, op) {
  return function () {
    return database.cancel(op.onComplete);
  };
};

exports._remove = function (database, op) {
  return function () {
    return database.remove(op.onComplete);
  };
};

exports._set = function (database) {
  return function () {
    return database.set();
  };
};

exports._setWithPriority = function (database) {
  return function () {
    return database.setWithPriority();
  };
};

exports._update = function (database) {
  return function () {
    return database.update();
  };
};

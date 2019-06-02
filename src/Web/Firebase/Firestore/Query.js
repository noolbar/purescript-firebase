"use strict"

exports._endAt = function (collection, snap) {
  return collection.endAt(snap);
};

exports._endBefore = function (collection, snap) {
  return collection.endBefore(snap);
};

exports._get = function (collection, opts) {
  return function () {
    return collection.get(opts.options);
  };
};

exports._isEqual = function (collection) {
  return function () {
    return collection.isEqual();
  };
};

exports._limit = function (collection, num) {
  return collection.limit(num);
};

exports._onSnapshot = function (collection, data) {
  return function () {
    collection.onSnapshot(data);
  };
};

exports._orderBy = function (collection, data) {
  return function () {
    collection.orderBy(data);
  };
};

exports._startAfter = function (collection, data) {
  return function () {
    return collection.startAfter(data);
  };
};

exports._startAt = function (collection, data) {
  return collection.startAt(data);
};

exports._querywithfilter = function (collection, path, filter, value) {
  return collection.where(path, filter, value);
};

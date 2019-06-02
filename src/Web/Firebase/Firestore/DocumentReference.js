"use strict";

exports._collection = function (doc, path) {
  return function () {
    return doc.collection(path);
  };
};

exports._delete = function (doc) {
  return function () {
    return doc.delete();
  };
};

exports._get = function (doc, opts) {
  return function () {
    return doc.get(opts.option)
  };
};

exports._isEqual = function (doc) {
  return function () {
    return doc.isEqual()
  };
};

exports._onSnapshot = function (doc, data) {
  return function () {
    return doc.onSnapshot(data);
  };
};

exports._set = function (doc, data, opts) {
  return function () {
    return doc.set(data, opts.options);
  };
};

exports._update = function (doc, data) {
  return function () {
    return doc.update(data);
  };
};

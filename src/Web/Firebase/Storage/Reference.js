"use strict"

exports._child = function (ref, path) {
  return function () {
    return ref.child(path);
  };
};
exports._delete = function (ref) {
  return function () {
    return ref.delete();
  };
};
exports._getDownloadURL = function (ref) {
  return function () {
    return ref.getDownloadURL();
  };
};
exports._getMetadata = function (ref) {
  return function () {
    return ref.getMetadata();
  };
};
exports._list = function (ref, opts) {
  return function () {
    return ref.list(opts.options);
  };
};
exports._listAll = function (ref) {
  return function () {
    return ref.listAll();
  };
};
exports._put = function (ref, data, opts) {
  return function () {
    return ref.put(scope, data, opts.metadata);
  };
};
exports._putString = function (ref, data, opts) {
  return function () {
    return ref.putString(scope, data, opts.format, opts.metadata);
  };
};
exports._toString = function (ref) {
  return function () {
    return ref.toString();
  };
};
exports._updateMetadata = function (ref, metadata) {
  return function () {
    return ref.updateMetadata(metadata);
  };
};

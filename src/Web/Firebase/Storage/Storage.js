"use strict"

exports._ref = function (storage, path) {
  return function () {
    return storage.ref(path);
  };
};

exports._refFromURL = function (storage, url) {
  return function () {
    return storage.refFromURL(url);
  };
};

exports._setMaxOperationRetryTime = function (storage, time) {
  return function () {
    return storage.setMaxOperationRetryTime(time);
  };
};

exports._setMaxUploadRetryTime = function (storage, time) {
  return function () {
    return storage.setMaxUploadRetryTime(time);
  };
};

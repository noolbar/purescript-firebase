"use strict"

exports._snapshotdata = function(documentSnapshot, opts) {
  return function() {
    return documentSnapshot.data(opts.options);
  };
};

exports._get = function(documentSnapshot, path, opts) {
  return function() {
    return documentSnapshot.get(path, opts.options);
  };
};

exports._isEqual = function(documentSnapshot, other) {
  return function() {
    return documentSnapshot.isEqual(other);
  };
};

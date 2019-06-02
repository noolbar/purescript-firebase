'use strict';

// module Web.Firebase.DataSnapshot

exports._exists = function (dataSnapshot) {
  return function () {
    dataSnapshot.exists();
  };
};

exports._hasChild = function (dataSnapshot) {
  return function (named) {
    return function () {
      return dataSnapshot.hasChild(named);
    };
  };
};

exports._hasChildren = function (dataSnapshot) {
  return function () {
    return dataSnapshot.hasChildren();
  };
};


exports._numChildren = function (dataSnapshot) {
  return function () {
    return dataSnapshot.numChildren();
  };
};

exports._child = function (dataSnapshot) {
  return function (named) {
    return function () {
      return dataSnapshot.child(named);
    };
  };
};

exports._val = function (dataSnapshot) {
  return function () {
    dataSnapshot.val();
  };
};

exports._key = function (dataSnapshot) {
  return dataSnapshot.key;
};

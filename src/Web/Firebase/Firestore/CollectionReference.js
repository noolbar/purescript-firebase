"use strict"

// exports._add = function (db) {
//   return function (collection) {
//     return function () {
//       db.collection(collection).add({
//         first: "Ada",
//         last: "Lovelace",
//         born: 1815
//       });
//     };
//   };
// };

// exports._get = function (db) {
//   return function (collection) {
//     return function () {
//       db.collection(collection).get().then(function (querySnapshot) {
//         querySnapshot.forEach(function (doc) {
//           console.log(doc.id);
//         });
//       });
//     };
//   };
// };

exports._add = function (collection, data) {
  return function () {
    return collection.add(data);
  };
};

exports._doc = function (collection, opts) {
  return function () {
    return collection.doc(opts.path);
  };
};

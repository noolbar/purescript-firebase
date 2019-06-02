
exports._forEach = function (q, func, opts) {
  return function () {
    q.forEach(func, opts.args);
  };
};

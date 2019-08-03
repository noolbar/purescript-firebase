"use strict"

exports._addScope = function (provider, scope) {
  return function () {
    return provider.addScope(scope);
  };
};

exports._setCustomParameters = function (rovider, customOAuthParameters) {
  return function () {
    return rovider.setCustomParameters(customOAuthParameters);
  };
};

exports._credential = function (rovider, token) {
  return function () {
    return rovider.credential(token);
  };
};

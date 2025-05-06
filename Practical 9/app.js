var app = angular.module('anujApp', []);

app.controller('MainController', function($scope) {
  $scope.showRegister = true;
  $scope.users = [];
  $scope.user = {};
  $scope.loginData = {};
  $scope.message = "";

  $scope.toggle = function() {
    $scope.showRegister = !$scope.showRegister;
    $scope.message = "";
  };

  $scope.register = function() {
    $scope.users.push(angular.copy($scope.user));
    $scope.message = "Welcome aboard, " + $scope.user.firstName + "! 🥳";
    $scope.user = {};
    $scope.toggle();
  };

  $scope.login = function() {
    var found = $scope.users.find(function(u) {
      return u.username === $scope.loginData.username && u.password === $scope.loginData.password;
    });

    if (found) {
      $scope.message = "Welcome back, " + found.firstName + "! You're cool! 😎";
    } else {
      $scope.message = "Oops! Wrong credentials. Even we mess up sometimes 🤷‍♂️";
    }

    $scope.loginData = {};
  };
});

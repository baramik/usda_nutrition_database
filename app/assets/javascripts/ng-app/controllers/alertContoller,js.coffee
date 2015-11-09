AlertsController = ($scope) ->
  $scope.alerts = [
    {
      type: 'success'
      msg: 'Thanks for visiting! Feel free to create pull requests to improve the dashboard!'
    }
    {
      type: 'danger'
      msg: 'Found a bug? Create an issue with as many details as you can.'
    }
  ]

  $scope.addAlert = ->
    $scope.alerts.push msg: 'Another alert!'
    return

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1
    return

  return

angular.module('FitnessPlatform').controller 'AlertsController', [
  '$scope'
  AlertsController
]
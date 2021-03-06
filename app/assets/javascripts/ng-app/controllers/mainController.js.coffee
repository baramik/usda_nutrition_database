MainController = ($scope, $cookieStore)->

  ###*
  # Sidebar Toggle & Cookie Control
  ###

  mobileView = 992

  $scope.getWidth = ->
    window.innerWidth

  $scope.$watch $scope.getWidth, (newValue, oldValue) ->
    if newValue >= mobileView
      if angular.isDefined($cookieStore.get('toggle'))
        $scope.toggle = if !$cookieStore.get('toggle') then false else true
      else
        $scope.toggle = true
    else
      $scope.toggle = false
    return

  $scope.toggleSidebar = ->
    $scope.toggle = !$scope.toggle
    $cookieStore.put 'toggle', $scope.toggle
    return

  window.onresize = ->
    $scope.$apply()
    return

  return

angular.module('FitnessPlatform').controller 'MainController', [
  '$scope'
  '$cookieStore'
  MainController
]
rdWidget = ->
  directive =
    transclude: true
    template: '<div class="widget" ng-transclude></div>'
    restrict: 'EA'

  link = (scope, element, attrs) ->

    ######

    return

  directive

angular.module('FitnessPlatform').directive 'rdWidget', rdWidget
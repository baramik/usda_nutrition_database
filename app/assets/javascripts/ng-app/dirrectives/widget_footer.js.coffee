rdWidgetFooter = ->
  directive =
    requires: '^rdWidget'
    transclude: true
    template: '<div class="widget-footer" ng-transclude></div>'
    restrict: 'E'
  directive

angular.module('FitnessPlatform').directive 'rdWidgetFooter', rdWidgetFooter
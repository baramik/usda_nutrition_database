rdLoading = ->
  directive =
    restrict: 'AE'
    template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'
  directive

angular.module('FitnessPlatform').directive 'rdLoading', rdLoading
angular.module('FitnessPlatform').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise 'dashboard'
  $stateProvider.state('dashboard',
    url: '/dashboard'
    templateUrl: 'dashboard.html'
    controller: 'MainController').state('food_items',
    parent: 'dashboard'
    url: '/food_items'
    templateUrl: 'food_items/food_items_list.html'
    controller: 'FoodItemsController').state('food_item_details',
    url: '/food_items/:id'
    templateUrl: 'food_items/food_item_details.html'
    controller: 'FoodItemDetailsController'
    parent: 'dashboard'
    )

angular.module('FitnessPlatform').config(['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
  cfpLoadingBarProvider.latencyThreshold = 500
])

#(->
#  FoodItemsController = ($scope, FoodItems)->
#    ### jshint validthis: true ###
#
#    vm = @
#    vm.errors = []
#    vm.foodItems = []
#
#    vm.pagination_options =
#      max_size: 5
#      current_page: 1
#      items_per_page: 25
#      total_items: 0
#
#    vm.loadPage = ->
#      service = FoodItems
#      service.getAll(page: vm.pagination_options.current_page).then ((resp) ->
#        vm.foodItems = resp.data.food_items
#        vm.pagination_options.total_items = resp.data.meta_data.total_count
#        return
#      ), (error) ->
#        console.log error
#        return
#    vm.loadPage()
#  angular.module('FitnessPlatform').controller 'FoodItemsController', ['$scope', 'FoodItems', FoodItemsController]
#)()

(->
  FoodItemsController = ($scope, FoodItems)->
    ### jshint validthis: true ###

    $scope.errors = []
    $scope.foodItems = []

    $scope.pagination_options =
      max_size: 5
      current_page: 1
      items_per_page: 25
      total_items: 0

    $scope.loadPage = ->
      service = FoodItems
      service.getAll(page: $scope.pagination_options.current_page).then ((resp) ->
        $scope.foodItems = resp.data.food_items
        $scope.pagination_options.total_items = resp.data.meta_data.total_count
        return
      ), (error) ->
        console.log error
        return
    $scope.loadPage()
  angular.module('FitnessPlatform').controller 'FoodItemsController', ['$scope', 'FoodItems', FoodItemsController]
)()
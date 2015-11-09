(->
  FoodItems = ($http) ->
    service = {}
    baseRoute = 'v1/food_items'
    service.getAll = (params)->
      $http.get(baseRoute, params: params)
    service.getOne = (params)->
      $http.get(baseRoute, params: params)
    return service
  angular.module('FitnessPlatform').service('FoodItems', FoodItems)
)()
/** Following is the AJAX controller call to fetch a page in AngularJS **/

function adController($http,$scope){
    var page = “http://localhost:8080/index.jsp”;
    @http.get(page).success( function(response) {
   		             $scope.object = response;	
                   });
}
# {REST-API} On-Laptop-Prices
Built in Python ,Framework Flask and Jwt Token Generate
## OVERVIEW :
The API is generally RESTFUL and returns results in JSON. JSON formats are returned by the API.
The API supports HTTP and HTTPS. 
The entire application is contained within the `app.py` file.
A REST API using Flask and MySQL with refference to the HTTP status codes,
headers and a json body parameter whcih is basically the response body of the particular requests.
When we send a request to the API, it will specify an HTTP method and a path.
To make a request, at first we have to choose that particular HTTP method and the endpoint for this operation that we want to use.
For example, `"../lap/getall"` this operation uses the GET method and returns a json response.

### LAPTOP ITMES :
The items are contained within the `laptopdata.csv` file.

## RUN THE APP(Virtual Environment): 
``` 
 $env:FLASK_DEBUG=1
 $env:PTHONDONTWRITEBYTECODE=1
 flask run
```
## VERSION :
```
Python 3.10.4
Flask 2.2.2
Werkzeug 2.2.2
```
## ROOT AND ENDPOINTS :
```
GET 	     ->     	   http://127.0.0.1:5000/
GET 	     -> 	       http://127.0.0.1:5000/lap/getall
POST	     ->	        http://127.0.0.1:5000/lap/addone
PUT	      ->     	   http://127.0.0.1:5000/lap/update
PATCH	    ->	        http://127.0.0.1:5000/lap/patch/<id>                   
DEL	      ->     	   http://127.0.0.1:5000/lap/delete/<id>
GET 	     ->        	http://127.0.0.1:5000/lap/getall/limit/<limit>/page/<pno>
GET	      ->	        http://127.0.0.1:5000/lap/pricerange/p1/<p1>/p2/<p2> 
POST      ->	        http://127.0.0.1:5000/lap/login/user
```
## HTTP VERBS :
| Verb          | Description   | 
| ------------- |:-------------:| 
|  GET	        |In this particular project it is used to retrieves all resources `..lap/getall`, with filter                                         `..lap/pricerange/p1/<p1>/p2/<p2>` and pagination `..lap/getall/limit/<limit>/page/<pno>`|  
|  POST         | Used to add new item.This route is called with full body detailed parameters `/lap/addone`|  
|  PUT          | Updates the whole resourse. The request will be send with the full body parameters`../lap/update` |  
|  PATCH	       |Updates partial data without changing the whole. Requested will be send with selected body parameters                                  `..lap/patch/<id>`|  
|  DELETE       |	Deletes data with the given item id. `../lap/delete/<id>`|  
|  HEADERS      | Content-Type : application/json |  

## HTTP RESPONSES :
HTTP response status codes indicates the specific HTTP request has been successfully completed.
- Successful responses (200 – 299)
- Client error responses (400 – 499)

In this project the following status codes has beed used :
```
200 -> OK - The query executed succesfully and completed the required task.
201 -> Created - Products has been added to database succesfully.
202 -> Accepted - It is used whenever the query is correct and also accepted but their is nothing to do, For eg. nothing to update,          nothing to delete.
204 -> No Content - Nothing to return from database in respect of that request.
410 -> Gone - This response is sent when the requested content has been permanently deleted from server, with no forwarding address.        Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be          used for "limited-time, promotional services". APIs should not feel compelled to indicate resources that have been deleted            with this status code.
```

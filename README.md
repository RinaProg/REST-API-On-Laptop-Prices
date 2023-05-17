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
The items are contained within the `laptopdata` file.

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
GET 	 -> 	http://127.0.0.1:5000/
GET 	 -> 	http://127.0.0.1:5000/lap/getall
POST	 ->	http://127.0.0.1:5000/lap/addone
PUT	  ->	http://127.0.0.1:5000/lap/update
PATCH	->	http://127.0.0.1:5000/lap/patch/<id>                   
DEL	  ->	http://127.0.0.1:5000/lap/delete/<id>
GET 	 ->	http://127.0.0.1:5000/lap/getall/limit/<limit>/page/<pno>
GET	  ->	http://127.0.0.1:5000/lap/pricerange/p1/<p1>/p2/<p2> 
POST  ->	http://127.0.0.1:5000/lap/login/user
```
## HTTP VERBS :
| Verb          | Description   | 
| ------------- |:-------------:| 
|  GET	        |n this particular project it is used to retrieves all resources `..lap/getall`, with filter                                         `..lap/pricerange/p1/<p1>/p2/<p2>` and pagination `..lap/getall/limit/<limit>/page/<pno>`|  
|  POST         |  |  |
|  PUT          |  |  |
|  PATCH	      |  |  |
|  DELETE       |  |  |
|  HEADERS      |  |  |

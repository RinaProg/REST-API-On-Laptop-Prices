# {REST-API} On-Laptop-Prices  &nbsp;<img src="https://lh3.googleusercontent.com/-XvJzhz3pfH0/XjYG_xWkESI/AAAAAAAAJ9c/AYlgAtRknEU2W5fMcFhQoL6rmO8EBtIDQCK8BGAsYHg/s0/2020-02-01.png" width="70px;" height="50px;" /> <br>
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
- GET 	     http://127.0.0.1:5000/
- GET 	     http://127.0.0.1:5000/lap/getall
- POST	     http://127.0.0.1:5000/lap/addone
- PUT	      http://127.0.0.1:5000/lap/update
- PATCH	    http://127.0.0.1:5000/lap/patch/<id>                   
- DEL	      http://127.0.0.1:5000/lap/delete/<id>
- GET 	     http://127.0.0.1:5000/lap/getall/limit/<limit>/page/<pno>
- GET	      http://127.0.0.1:5000/lap/pricerange/p1/<p1>/p2/<p2> 
- POST      http://127.0.0.1:5000/lap/login/user
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
202 -> Accepted - It is used whenever the query is correct and also accepted but their is nothing to do, For eg. nothing to update,nothing to delete.
204 -> No Content - Nothing to return from database in respect of that request.
410 -> Gone - This response is sent when the requested content has been permanently deleted from server, with no forwarding address.        Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be          used for "limited-time, promotional services". APIs should not feel compelled to indicate resources that have been deleted with this status code.
```
## PAGINATION :
When the response has too many values to show, the pagination function makes easy to provide limited selcted data in a page, it return a subset of the response.In this case request additional pages of data.The endpoint supports the page and limit parameter, which control the number of results returned on a page. `../lap/getall/limit/<limit>/page/<pno>`

## CORS AND JWT (Cross origin resource sharing & Json Web Token) :
```python
def login_user_model(self,data):
        qry=f"SELECT u_id,name,email,phone FROM users WHERE email='{data['email']}' AND password='{data['password']}' "
        self.cur.execute(qry)
        res=self.cur.fetchall()
        user_data=res[0]
        exp_time=datetime.now() + timedelta(minutes=30)
        exp_epoch_time=int(exp_time.timestamp())
        payload={
            "payload":user_data,
            "exp_time":exp_epoch_time
        }
        jwtoken=jwt.encode(payload,"",algorithm="HS256")     #Hide "secret key"
        return make_response({"token":jwtoken},200)
```
## JSON TYPE RESPONSES EXAMPLES :
- METHOD : http://127.0.0.1:5000/lap/getall 
```
{
  "payload": [
    {
      "company": "Apple",
      "cpu": "Intel Core i5 1.8GHz",
      "gpu": "Intel HD Graphics 6000",
      "inches": 13.3,
      "memory": "128GB Flash Storage",
      "opsys": "macOS",
      "p_id": 1,
      "price": 47895.5234,
      "ram": "8GB",
      "screenresolution": "1440x900",
      "typename": "Ultrabook",
      "weight": "1.34kg"
    },
    {
      "company": "hp",
      "cpu": "Intel Core i5 7200U 2.5GHz",
      "gpu": "Intel HD Graphics 620",
      "inches": 15.6,
      "memory": "256GB SSD",
      "opsys": "No OS",
      "p_id": 2,
      "price": 30636.0,
      "ram": "8GB",
      "screenresolution": "Full HD 1920x1080",
      "typename": "Notebook",
      "weight": "1.86kg"
    },
    .....
    .....
```
- METHOD : http://127.0.0.1:5000/lap/pricerange/p1/<p1>/p2/<p2> 
```
{
  "filter_item": [
    {
      "company": "Apple",
      "cpu": "Intel Core i5 1.8GHz",
      "gpu": "Intel HD Graphics 6000",
      "inches": 13.3,
      "memory": "128GB Flash Storage",
      "opsys": "macOS",
      "p_id": 1,
      "price": 47895.5234,
      "ram": "8GB",
      "screenresolution": "1440x900",
      "typename": "Ultrabook",
      "weight": "1.34kg"
    },
    {
      "company": "hp",
      "cpu": "Intel Core i5 7200U 2.5GHz",
      "gpu": "Intel HD Graphics 620",
      "inches": 15.6,
      "memory": "256GB SSD",
      "opsys": "No OS",
      "p_id": 2,
      "price": 30636.0,
      "ram": "8GB",
      "screenresolution": "Full HD 1920x1080",
      "typename": "Notebook",
      "weight": "1.86kg"
    },
    {
      "company": "Acer",
      "cpu": "AMD A9-Series 9420 3GHz",
      "gpu": "AMD Radeon R5",
      "inches": 15.6,
      "memory": "500GB HDD",
      "opsys": "Windows 10",
      "p_id": 5,
      "price": 21312.0,
      "ram": "4GB",
      "screenresolution": "1366x768",
      "typename": "Notebook",
      "weight": "2.1kg"
    },
  ]
}
```
- METHOD : http://127.0.0.1:5000/lap/getall/limit/2/page/4 
```
 {
  "page": 4,
  "payload": [
    {
      "company": "Apple",
      "cpu": "Intel Core i5 1.8GHz",
      "gpu": "Intel HD Graphics 6000",
      "inches": 13.3,
      "memory": "256GB Flash Storage",
      "opsys": "macOS",
      "p_id": 7,
      "price": 61735.5352,
      "ram": "8GB",
      "screenresolution": "1440x900",
      "typename": "Ultrabook",
      "weight": "1.34kg"
    },
    {
      "company": "Asus",
      "cpu": "Intel Core i7 8550U 1.8GHz",
      "gpu": "Nvidia GeForce MX150",
      "inches": 14.0,
      "memory": "512GB SSD",
      "opsys": "Windows 10",
      "p_id": 8,
      "price": 79653.6016,
      "ram": "16GB",
      "screenresolution": "Full HD 1920x1080",
      "typename": "Ultrabook",
      "weight": "1.3kg"
    }
  ],
  "row_limit": 2
}
```
## TECHNOLOGY USED :
<p><img src="https://www.vectorlogo.zone/logos/pocoo_flask/pocoo_flask-ar21.png" width="70" height="70">&nbsp;&nbsp;
<img src="https://github.com/RinaProg/REST-API-On-Laptop-Prices/assets/122221586/eb5bca2d-3325-4554-9ee2-a3e45cffb325" width="70" height="70">&nbsp;&nbsp;
<img src="https://assets.tradeholders.com/img/technologies/json.png" width="70" height="70">&nbsp;&nbsp;
<img src="https://jwt.io/img/logo-asset.svg" width="70" height="70">&nbsp;&nbsp;
<img src="https://www.katk.dev/static/86f2f48b9b0dd900b4892f49f4bbab81/e4f06/logo.png" width="70" height="70">&nbsp;&nbsp;</p>

## TALK ABOUT :
Thank you for visit here,i am still working on this api project(Token authentication and authorization) and after completing I will be commited it here.Hope you all like my documentation.
😊 

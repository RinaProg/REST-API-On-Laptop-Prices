import mysql.connector
# import json
from flask import make_response
from datetime import datetime,timedelta
import jwt

class lap_item_model:
    def __init__(self):
        try:
            self.conn = mysql.connector.connect(host="localhost",user="root",password="",database="restproj2")
            self.conn.autocommit=True
            self.cur = self.conn.cursor(dictionary=True)
            
            print("successfully connected...")
        except:
            print("no connection...")    


    def lap_getall_model(self):
        qry="SELECT * FROM lapitem"
        self.cur.execute(qry)
        res=self.cur.fetchall()
        # print(res)
        if len(res)>0:
            # return json.dumps(res)
            return make_response({"payload":res},200)
        else:
            return make_response({"message":"No Data Found"},204)
        
    def lap_addone_model(self,data):
        qry=f"INSERT INTO lapitem (company,typename,inches,screenresolution,cpu,ram,memory,gpu,opsys,weight,price) VALUES ('{data['company']}','{data['typename']}','{data['inches']}','{data['screenresolution']}','{data['cpu']}','{data['ram']}','{data['memory']}','{data['gpu']}','{data['opsys']}','{data['weight']}','{data['price']}')"  
        self.cur.execute(qry)
        print(data['company'])
        return make_response({"message":"Product Created Successfully"},201)
    
    def lap_update_model(self,data):
        qry=f"UPDATE lapitem SET company='{data['company']}',typename='{data['typename']}',inches='{data['inches']}',screenresolution='{data['screenresolution']}',cpu='{data['cpu']}',ram='{data['ram']}',memory='{data['memory']}',gpu='{data['gpu']}',opsys='{data['opsys']}',weight='{data['weight']}',price='{data['price']}' WHERE p_id={data['p_id']}"
        self.cur.execute(qry)
     
        if self.cur.rowcount>0:
            
            return  make_response({"message":"Product Updated Successfully"},201)
        else:
            return make_response({"message":"Nothing To Update"},202)

    def lap_delete_model(self,id):
        qry=f"DELETE FROM lapitem WHERE p_id={id}"
        self.cur.execute(qry)
        if self.cur.rowcount>0:
            return  make_response({"message":"Product Deleted Successfully"},410)
        else:
            return make_response({"message":"Nothing To Deleted"},202)
        
    def lap_pricerange_model(self,p1,p2):
        
        qry=f"SELECT * FROM lapitem WHERE price BETWEEN {p1} AND {p2}"
        self.cur.execute(qry)
        res=self.cur.fetchall()
        # print(res)
        if len(res)>0:
            return make_response({"filter_item":res},200)
        else:
            return make_response({"message":"No Data Found"},204)

    def lap_patch_model(self,id,data):
        
        qry="UPDATE lapitem SET "
        for key in data:
            # print(f"{key} = {data[key]}")
            qry=f"{qry}" + f"{key}='{data[key]}',"
        qry=f"{qry[:-1]}" + f" WHERE p_id={id}"   
        self.cur.execute(qry) 
        if self.cur.rowcount>0:
            return make_response({"message":"Product Updated Successfully"},201)
        else:
            return make_response({"message":"Nothing To Update"},202)
        
    def lap_pagination_model(self,limit,pno):
        limit=int(limit)
        pno=int(pno)
        start=(pno * limit)- limit
        qry=f"SELECT * FROM lapitem LIMIT {start}, {limit}"
        self.cur.execute(qry)
        res=self.cur.fetchall()
        if len(res)>0:
            return make_response({"payload":res , "row_limit":limit, "page":pno},200)
        else:
            return make_response({"message":"No Data Found!"},204)
        
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
        


        

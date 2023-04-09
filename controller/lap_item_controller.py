from app import app
from model.lap_item_model import lap_item_model
from flask import request

obj=lap_item_model()

@app.route('/lap/getall',methods=['GET'])
def lap_getall_controller():
    return obj.lap_getall_model()

@app.route('/lap/addone',methods=['POST'])
def lap_addone_controller():
    # request.form
    return obj.lap_addone_model(request.form)

@app.route('/lap/update',methods=['PUT'])
def lap_update_controller():
    # print(request.form)
    return obj.lap_update_model(request.form)

@app.route('/lap/delete/<id>',methods=['DELETE'])
def lap_delete_controller(id):

    return obj.lap_delete_model(id)

@app.route('/lap/patch/<id>',methods=['PATCH'])
def lap_patch_controller(id):
    print(request.form)
    return obj.lap_patch_model(id,request.form)


@app.route('/lap/pricerange/p1/<p1>/p2/<p2>',methods=['GET'])
def lap_pricerange_controller(p1,p2):
    return obj.lap_pricerange_model(p1,p2)

@app.route('/lap/getall/limit/<limit>/page/<pno>',methods=['GET'])
def lap_pagination_controller(limit,pno):
    # print(request.form)
    return obj.lap_pagination_model(limit,pno)

@app.route('/lap/login/user',methods=['POST'])
def lap_login_user_controller():
    # print(request.form)
    return obj.login_user_model(request.form)
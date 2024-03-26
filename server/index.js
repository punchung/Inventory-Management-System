const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');
const cors = require('cors');
const app = express();

app.use(bodyParser.json());
app.use(cors());

const port = 8500; //port number
let product = []
let counter = 1
let conn = null

const initMysql = async () => { //mysql connection
    try {
        conn = await mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'root',
            database: 'webdb',
            port: 8700 
        });
    } catch (err) {
        console.error('Error occurred while creating connection to database', err);
    }
}

//validateData เว้นไว้ก่อน
/*const validateData = (userData) => {
    let errors = []
    if (!userData.productname){
        errors.push('กรุณากรอกชื่อสินค้า')
    }
    if (!userData.branad){
        errors.push('กรุณากรอก')
    }
    if (!userData.description){
        errors.push('กรุณากรอก')
    }
    if (!userData.stockon){
        errors.push('กรุณาเลือก')
    }
    if (!userData.price){
        errors.push('กรุณาเลือก')
    }
    if (!userData.category){
        errors.push('กรุณากรอก')
    }
    if (!userData.dateadd){
        errors.push('กรุณากรอก')
    }
    if (!userData.dateup){
        errors.push('กรุณากรอก')
    }
    if (!userData.status){
        errors.push('กรุณากรอก')
    }
    if (!userData.admin){
        errors.push('กรุณากรอก')
    }
    if (!userData.note){
        errors.push('กรุณากรอก')
    }
  
    return errors
  }*/

//path = GET /product สำหรับ get product ทั้งหมดที่บันทึกเข้าไปออกมา
app.get('/product', async (req, res) => {
    const result = await conn.query('SELECT * FROM product');
    res.json(result[0]);
});


//path = POST /product สำหรับเพิ่ม product ใหม่
//ยังinsert ข้อมูลไม่ได้
app.post('/product',async (req,res)=>{
    try{
        let product = req.body
        const errors = validateData(product)
        if(errors.length > 0){
            throw{
              message : 'กรอกข้อมูลให้ครบถ้วน',
              errors : errors
            }
          }
        const result = await conn.query('INSERT INTO product SET ?', product);
        res.json({
            message: 'Create new user successfully',
            data: result[0]
          })
    
    }catch (error) {
        const errorMessage = error.errors || 'something went wrong'
        const errors = error.errors || []
        console.log('errorMessage',error.message) 
        res.status(500).json({
          message: errorMessage ,
          errors: errors 
        })
      }
})


//path = GET /product/:productid สำหรับ get product ตาม id ที่ระบุ
app.get('/product/:productid', async(req,res)=> {
    try{
        let productid = req.params.productid
        const result = await conn.query('SELECT * FROM product WHERE productid = ?',productid);
        if(result[0].length == 0){
            throw{statusCode:404,message:'product not found'}
        }
        res.json(result[0][0])

    } catch(error){
        console.log('errorMessage',error.message)
        let statusCode= error.statusCode || 500
        res.status(statusCode).json({
            message: 'something went wrong',
            errorMessage: error.message
        })
    }
})


//path = PUT /product/:productid สำหรับแก้ไข product ที่มี id ตามที่ระบุ
app.put('/product/:productid',async(req,res)=>{
    try{
        let productid = req.params.productid;
        let updateproduct = req.body;
        const result = await conn.query('UPDATE product SET ? WHERE productid = ?',
        [updateproduct,productid]);
        res.json({
            message: 'Update product successfully',
            data:result[0]
        })
    }catch(error){
        console.log('errorMessage',error.message)
        res.status(500).json({
            message: 'something went wrong',
            errorMessage: error.message
        })
    
    }
})


//path = DELETE /product/:productid สำหรับลบ product ที่มี id ตามที่ระบุ
app.delete('/product/:productid',async(req,res)=>{
    try{
        let productid = req.params.productid;
        const result = await conn.query('DELETE FROM product WHERE productid = ?',productid);
        res.json({
            message: 'Delete product successfully',
            data:result[0]
        })
    }catch(error){
        console.log('errorMessage',error.message)
        res.status(500).json({
            message: 'something went wrong',
        })
    }
})


//port 8500
app.listen(port, async(req, res) => { //start server รันที่ port 8500
    await initMysql()
    console.log('http server running on', +port)
})

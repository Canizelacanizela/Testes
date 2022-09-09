const express = require("express");
const cors = require("cors");
const mysql = require("mysql");
const lan = require("./src/lanca.js");

const app = express();
app.use(cors());

const con = mysql.createConnection({
    user:'root',
    host:'localhost',
    database:'lancamentos'
});

app.get('/lancamentos/debitos', (req,res) =>{
    let string = "select * from vw_debitos order by e_lancamentos";
    con.query(string,(err,result)=>{
        if(err == null){
            res.json(lan.debitos(result));
        }
    });
});

app.get('/lancamentos/creditos', (req,res) =>{
    let string = "select * from vw_credito order by e_lancamentos";
    con.query(string,(err,result)=>{
        if(err == null){
            res.json(lan.debitos(result));
        }
    });
});

app.listen(3000,() => {
    console.log("Respondendo")
});
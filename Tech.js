// Tech.js 
const express= require('express');
const app= express();
const port=9999;

// GET 
app.get('/', (req, res) => {
    res.send('Dockerfile Node js Çalıştı');
    res.setHeader('Content-Type', 'text/plain');
    res.statusCode=200;
});

// LISTEN
app.listen(port,()=>{
    console.log(`Tech js app listening Server http://localhost:${port} portunda çalışıyor`);
})
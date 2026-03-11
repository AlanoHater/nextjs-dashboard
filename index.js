const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('<h1>¡Confirmado! El autorefresh funciona ⚡🚀</h1>');
});

app.listen(port, () => {
  console.log(`Aplicación escuchando en http://localhost:${port}`);
});

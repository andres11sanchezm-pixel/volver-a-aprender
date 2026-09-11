const http = require('http');
const fs = require('fs');
const path = require('path');

const root = __dirname;
const mime = { '.html': 'text/html; charset=utf-8', '.css': 'text/css', '.js': 'text/javascript', '.jpg': 'image/jpeg', '.png': 'image/png', '.pdf': 'application/pdf' };

http.createServer((request, response) => {
  const requested = decodeURIComponent(request.url.split('?')[0]);
  const relative = requested === '/' ? '/Index.html' : requested;
  const filePath = path.resolve(root, '.' + relative);
  if (!filePath.startsWith(root) || !fs.existsSync(filePath) || fs.statSync(filePath).isDirectory()) {
    response.writeHead(404); response.end('Archivo no encontrado'); return;
  }
  response.writeHead(200, { 'Content-Type': mime[path.extname(filePath).toLowerCase()] || 'application/octet-stream' });
  fs.createReadStream(filePath).pipe(response);
}).listen(8080, '127.0.0.1', () => console.log('Volver a Aprender disponible en http://localhost:8080/'));

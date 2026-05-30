const fs = require('fs');
const content = fs.readFileSync('E:/OneDrive/桌面/biocce-new-site/scene-images.js', 'utf8');
const keys = ['gate','scene1','scene2','scene3'];
const names = {gate:'factory-gate',scene1:'capability-1',scene2:'capability-2',scene3:'capability-3'};
const dir = 'E:/OneDrive/桌面/biocce-new-site/images';
if (!fs.existsSync(dir)) fs.mkdirSync(dir);
for (const key of keys) {
  const idx = content.indexOf("'" + key + "'");
  if (idx < 0) { console.log(key + ': not found'); continue; }
  const dStart = content.indexOf("'data:image", idx);
  if (dStart < 0) { console.log(key + ': no data'); continue; }
  const b64Start = dStart + 22;
  const b64End = content.indexOf("'", b64Start);
  if (b64End < 0) { console.log(key + ': no end quote'); continue; }
  let b64 = content.substring(b64Start, b64End);
  const pad = b64.length % 4;
  if (pad) b64 += '='.repeat(4 - pad);
  const buf = Buffer.from(b64, 'base64');
  fs.writeFileSync(dir + '/' + names[key] + '.png', buf);
  console.log(names[key] + ': ' + (buf.length/1024).toFixed(0) + 'KB OK');
}

const fs = require('fs');
let spawn = require('child_process').spawn;

function runScript(scriptPath) {
  return new Promise((resolve, reject) => {
    let child = spawn('bash', [scriptPath]);
    child.stderr.on('data', (data) => {
      reject('Error: ' + data);
    });
    child.on('exit', function () {
      resolve('exit');
    });
  });
}

module.exports = {
  runScript
}

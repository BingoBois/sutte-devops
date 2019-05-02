const http = require('http');
const createHandler = require('github-webhook-handler');
const handler = createHandler({ path: '/webhook', secret: 'sutmig' });
const { runScript } = require('./updatecluster');

const BASE_PATH = '/home/bingo/sutte-devops';

let buildEvents = [`Waiting for work | TIME: ${new Date(new Date().getTime())}`];

http.createServer(function (req, res) {
  handler(req, res, function (err) {
    res.statusCode = 404
    let prettyMessage = `Building events: \n\n\n\n`;
    for(let i = buildEvents.length; i > 0; i--){
      prettyMessage += `${buildEvents[i - 1]}\n\n`
    }
    res.end(prettyMessage);
  })
}).listen(7777)
 
handler.on('*', (event) => {
  console.log(event)
    if(event.payload.state){
      if(event.payload.name.split("/")[1].includes("frontend")){
        console.log("received update for frontend")
        switch(event.payload.state){
          case 'success': 
            runScript(`${BASE_PATH}/referenceScripts/staging/front/updateService.sh`)
            buildEvents.push([`Tests Passed - Updating Cluster | TIME: ${new Date(new Date().getTime())}`])
          break;
          case 'failure': 
            buildEvents.push([`Tests Failed | TIME: ${new Date(new Date().getTime())}`])
          break;
        }
      }else if(event.payload.name.split("/")[1].includes("backend")){
        console.log("received update for backend")
        switch(event.payload.state){
          case 'success': 
            runScript(`${BASE_PATH}/referenceScripts/staging/back/updateService.sh`)
            buildEvents.push([`Tests Passed - Updating Cluster | TIME: ${new Date(new Date().getTime())}`])
          break;
          case 'failure': 
            buildEvents.push([`Tests Failed | TIME: ${new Date(new Date().getTime())}`])
          break;
        }
      }else{
        console.log("cannot read payload")
        console.log(event);
      }
    }
})

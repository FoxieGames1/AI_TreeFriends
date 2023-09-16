const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const axios = require('axios');

const {Client, GatewayIntentBits, Partials, Collection, Message, MessageActivityType} = require('discord.js');
const config = require('./config.json');

const client = new Client({
    intents:[Object.keys(GatewayIntentBits)],
    partials:[Object.keys(Partials)],

});

// Importing the required modules
const WebSocketServer = require('ws');

// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 3000 })

//For Avoid the Memory Leak
process.setMaxListeners(0);
require('events').EventEmitter.defaultMaxListeners = Infinity;

var Version = "Beta - 0.1";
var EVENTPLUS = 1
var CheckTopic = 1

var Writing = false;
var NewValue = false;

var MessageMax = 2
var MessageNum = 0

var Messages = [];
var clientID = 0;

var CharacterToTalk = "";
var Chara = "";
var mesTex = "";
var mesCon = "";
var MSG = "";
var MESSAGE = "";

var OpenToCall = false;

const prefix = '!';
const Names = 'Flaky '+"&"+' Toothy.';

let topicOpen = false; // Variable para rastrear si el tema está abierto o cerrado
let currentTopic = ''; // Variable para almacenar el tema actual

client.on('messageCreate', (message) => 
{
  if (message.content.startsWith(prefix))
  {
    const args = message.content.slice(prefix.length).trim().split(/ +/);
        const command = args.shift().toLowerCase();

        if (command === 'topic') {
          if (args.length === 0) {
            // Comando !topic sin argumento muestra el estado actual
            message.reply(`Use "**!topic open**" to create a topic.\nUse "**!topic close**" to close the topic.\nUse "**!topic status**" to check the status of topic.`);
          } else if (args[0].toLowerCase() === 'open') {
            // Comando !topic open para abrir un tema
            if (topicOpen) 
            {
               message.reply("You can't create a new topic, is already open!")    
            } 
            else 
            if (topicOpen == false && OpenToCall == false) 
            {
              const topicName = args.slice(1).join(' ');
              if (topicName.length === 0) 
              {
                if (Writing == false)
                {message.reply("You can't create a new topic without a text.");}
                else
                if (Writing == true)
                {message.reply("Reading the Values on streaming...");}  
              }
              else
              {
                  if (Writing == true && NewValue == true)
                  {
                    OpenToCall = true;

                    Writing = false;
                    currentTopic = topicName
                    topicOpen = true;
                    Suggested_Topic = `Suggested Topic: ${currentTopic}`;
    
                    if (currentTopic == "Closed Topic")
                    {currentTopic = "Closed Topic.";}
                    
                    var MSG_TEXT = `${currentTopic}`;
                    message.reply(Suggested_Topic);
                    MSG = MSG_TEXT;
                    mesCon = MSG;
                    
                    RestartEntornVars(true)
                  }
                  else
                  if (Writing == false && NewValue == false)
                  {
                    OpenToCall = true;

                    currentTopic = topicName
                    topicOpen = true;
                    Suggested_Topic = `Suggested Topic: ${currentTopic}`;
    
                    if (currentTopic == "Closed Topic")
                    {currentTopic = "Closed Topic.";}
                    
                    var MSG_TEXT = `${currentTopic}`;
                    message.reply(Suggested_Topic);
                    MSG = MSG_TEXT;
                    mesCon = MSG;
                    RestartEntornVars(true)
                  }
                  else
                  if (Writing == true && NewValue == false)
                  {message.reply("Reading the Values on streaming...");}  
              }
            }
            else
            {message.reply("Reading the Values on streaming...");}
          }
            else if (args[0].toLowerCase() === 'status') {
                if (topicOpen) {
                    message.reply(`Topic Theme: ${currentTopic} (Open)`);
                  } else {
                    message.reply(`Topic is Closed.`);
                  }
            } 
            else if (args[0].toLowerCase() === 'close') {
            // Comando !topic close para cerrar el tema
            if (topicOpen) 
            {
              if (MessageNum >= MessageMax)
              {
                  if (Writing == false)
                  {
                    OpenToCall = 2;
                    topicOpen = false;
                    Writing = true;
                    CheckTopic++;
                    RestartFun(true)
                    message.reply('Topic Closed.');
                  }
                  else
                  if (Writing == true && NewValue == true)
                  {
                    NewValue = false;
                  }
              }
              else
              if (MessageNum < MessageMax)
              {
                  message.reply(`Minimum number of messages is ${MessageNum}/${MessageMax}.`);
              }
            } 
            else 
            {
              message.reply('Topic is already Closed.');
            }
          }
      }
      else
      if (command == 'talk' && topicOpen) 
      {
          var character = args.shift(); // Obtener el nombre del personaje
          CharacterToTalk = character;
          
          if (character) 
          {
            var messageContent = args.join(' '); // Obtener el contenido del mensaje
            if (messageContent)
            {
                OpenToCall = 5;
                MessageNum++
                EVENTPLUS++;
                mesTex = messageContent;
                Chara = CharacterToTalk;
            }
            else
            {
              message.reply('Add a message.');
            }
          } 
          else 
          {
             message.reply('Add a character.\n**-Character List-**\n'+Names);
          }
      }
  }
})

wss.on("connection", ws => 
{
  clientID++
  console.log("Reconected "+clientID+" Times");

    ws.on("message", data => 
    {
        var realData = JSON.parse(data);
        var eventName = realData.eventName;
        switch(eventName)
        {
            case "Connected_Server":
              console.log("Connected")
            break;
            case "Send_Topic":
              if (OpenToCall == true)
              { 
                CheckTopic = 0;

                if (mesCon != MESSAGE){MESSAGE = mesCon}
                                
                var Topic_send = {
                  id: clientID,
                  message_topic: mesCon
                }
                Messages.push(Topic_send)
                
                ws.send(
                  JSON.stringify({
                    eventName: "Send_Topic",
                    id: clientID,
                    message_topic: mesCon
                  }
                  ));
                  console.log("Send Topic")
                  OpenToCall = false
              }
            break;
            case "Send_Message":
              if (OpenToCall == 5)
              {
                if (CharacterToTalk != Chara){CharacterToTalk = Chara;}
                if (mesTex != MESSAGE){MESSAGE = mesTex}
                                
                var Messages_send = {
                  id: clientID,
                  message_nick: Chara,
                  message_text: mesTex,
                  eventPlus: EVENTPLUS
                }
                
                Messages.push(Messages_send)
    
                ws.send(
                  JSON.stringify({
                    eventName: "Send_Message",
                    id: clientID,
                    message_nick: Chara,
                    message_text: mesTex,
                    eventPlus: EVENTPLUS
                  }));
                  console.log("Send Message")
                  OpenToCall = false;
              }
            break;
            case "Close_Topic":
              if (OpenToCall == 2)
              {
                  ws.send(
                    JSON.stringify({
                      eventName: "Close_Topic",
                      changeNumber: CheckTopic
                    }));          

                  console.log("Close Topic")
                  OpenToCall = 3;
              }
            break;
            case "Restart_New": //TEMPORAL
            if (OpenToCall == 3)
            {
                NewValue = true

                ws.send(
                  JSON.stringify({
                    id: clientID,
                    eventName: "Restart_New",
                    setNew: NewValue,
                    setReading: Writing
                  }));  
                  console.log("Restarting")
                OpenToCall = false;
            }
            break; //TEMPORAL
        }
    })
    
    // handling what to do when clients disconnects from server
    ws.on("close", () => { 
      console.log("Application Closed.");
    })
                
    // handling client connection error
    ws.onerror = function () {
      console.log("Some Error occurred");
      }
});


// Configurar body-parser para analizar JSON
app.use(bodyParser.json());

app.post('/enviar-informacion', (req, res) => {
    const data = req.body; // Datos enviados desde Discord.js
    // Procesar la información aquí
    res.send('Información recibida y procesada con éxito');
  });


client.login(config.token).then(() => {
    console.log(`${client.user.username} is Online`);
}).catch((err) => {
    console.log(`err`);
})

function RestartFun(Active)
{
  if (Active = true)
  {
      Messages = [];
        
      MessageNum = 0
      CharacterToTalk = "";
      Chara = "";
      mesTex = "";
      mesCon = "";
      MSG = "";
      MESSAGE = "";

      Active = false
  }
}

function RestartEntornVars(Active)
{
    if (Active = true)
    {
        EVENTPLUS = 1
        CheckTopic = 1  
        Active = false
    }
}
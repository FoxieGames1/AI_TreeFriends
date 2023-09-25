const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const axios = require('axios');

const {Client, GatewayIntentBits, Partials, Collection, Message, MessageActivityType} = require('discord.js');
const config = require('./config.json');

const client = new Client({
    intents:[Object.keys(GatewayIntentBits)],
    partials:[Object.keys(Partials)]
});

// Importing the required modules
const WebSocketServer = require('ws');

// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 3000 })

//For Avoid the Memory Leak
process.setMaxListeners(0);
require('events').EventEmitter.defaultMaxListeners = Infinity;

var Version = "0.5b";
var CheckTopic = 1

var Messages = [];
var clientID = 0;

var CharacterToTalk = "";
var Chara = "";
var MSG = "";
var mesTex = "";
var MESSAGE = "";

var SelectedLan = "English";
var CharLan = "English";
var Lenguaje = "English";

var OpenToCallLan = false;
var OpenToCall = false;

const prefix = '!';
const Names = 'Flaky, Toothy, Handy, Giggles & Petunia';

const usuariosEnTemas = new Map();
let owners = [];
const temas = new Map(); // Un mapa para realizar un seguimiento de los temas y su estado
const temasCerradosPorUsuario = new Map(); // Usar un mapa para llevar un registro de los temas cerrados por cada usuario
const talkCounts = new Map(); // Crear un Map para llevar un recuento de usos de !talk por cada usuario

const TemaTituloUsuarios = new Map();
const TemaLengthUsuarios = new Map();
const TemaIDUsuarios = new Map();
const ValorASumar = 1
var ValorASumar2 = 1;
var RealTemaName = "";
var SizeOfTopic = 1;
var TemaIDNormal = 1

client.on('messageCreate', (message) => 
{
    if (message.content.startsWith(prefix))
    {
        const args = message.content.slice(prefix.length).trim().split(/ +/);
        const command = args.shift().toLowerCase();
        if (command === 'topic') 
        {
          if (args.length === 0) 
          {
            if (Lenguaje == "English")
            {
              message.reply('You must specify a subcommand (open, status, close, cancel) for the !topic command.');
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('Debes especificar un subcomando (open, status, close, cancel) para el comando !topic.');
            }
          } 
          else 
          if (args[0].toLowerCase() === 'open') 
          {
            // ... código para abrir un nuevo tema
            if (!temas.has(message.author.id)) 
            {
              // Verificar si el autor no es el dueño de un tema existente
              if (!usuariosEnTemas.has(message.author.id))
              {
                if (!temasCerradosPorUsuario.has(message.author.id)) 
                {
                  const nombreDelTema = args.slice(1).join(' '); // Obtener el nombre del tema
                  if (!nombreDelTema) 
                  {
                    if (Lenguaje == "English")
                    {
                      message.reply('You must specify a name for the topic.');
                    }
                    else
                    if (Lenguaje == "Español")
                    {
                      message.reply('Debes especificar un nombre para el tema.');
                    }
                  }
                  else
                  {
                    // Verificar si el nombre del tema ya existe
                    const temaExistente = Array.from(temas.values()).find(tema => tema.name === nombreDelTema);

                    if (temaExistente) 
                    {
                      if (Lenguaje == "English") 
                      {
                        message.reply('A topic with this name already exists. Please choose a different name.');
                      } 
                      else
                      if (Lenguaje == "Español") 
                      {
                        message.reply('Ya existe un tema con este nombre. Por favor, elige un nombre diferente.');
                      }
                    } 
                    else
                    {
                      // Verificar si el autor no está unido a un tema recién creado
                      const temaID = `${message.author.id}_${temas.size + 1}`;
                      owners.push(message.author); // Agregar al usuario a la matriz de propietarios
                      temas.set(temaID, { name: nombreDelTema, owners, abierto: true });
                      TemaTituloUsuarios.set(message.author.id, nombreDelTema);
                      usuariosEnTemas.set(message.author.id, temaID); // Registrar al usuario en el tema
                      if (Lenguaje == "English")
                      {
                        message.reply(`Suggested Topic: ${nombreDelTema}`);
                      }
                      else
                      if (Lenguaje == "Español")
                      {
                        message.reply(`Tema Sugerido: ${nombreDelTema}`);
                      }

                      var MSG_TEXT = `${nombreDelTema}`;
                      MSG = MSG_TEXT;
                      mesCon = MSG;

                      const temaCreadorID = temaID.split('_')[0];

                      if (TemaTituloUsuarios.has(temaCreadorID))
                      {
                        const TemaAlmacenado = TemaTituloUsuarios.get(temaCreadorID);
                        TemaLengthUsuarios.set(temaCreadorID, 1);
                        RealTemaName = TemaAlmacenado

                        TemaIDUsuarios.set(temaCreadorID, ValorASumar2)
                        const TemaIDCreation = TemaIDUsuarios.get(temaCreadorID)
                        TemaIDNormal = TemaIDCreation
                      }

                      ValorASumar2++
                      
                      OpenToCall = true;
                    }
                  }
                }
              } 
              else
              {
                if (Lenguaje == "English")
                {
                  message.reply('You cannot open a new topic while you are joined to one.');
                }
                else
                if (Lenguaje == "Español")
                {
                  message.reply('No puedes abrir un nuevo tema mientras estás unido a uno.');
                }
              }
            } 
            else
            {
              if (Lenguaje == "English")
              {
                message.reply('You are already the owner of a topic.');
              }
              else
              if (Lenguaje == "Español")
              {
                message.reply('Ya eres el dueño de un tema.');
              }
            }
          }
          else
          if (args[0].toLowerCase() === 'close') 
          {
            const temaID = usuariosEnTemas.get(message.author.id);

            const tema = temas.get(temaID);

            // Obtener las IDs de todos los usuarios en el mismo tema (sin duplicados)
            const usuariosEnEsteTema = [...new Set([...owners.map(owner => owner.id), ...usuariosEnTemas.keys()])];

            // Obtener los recuentos de mensajes para cada usuario en este tema
            const talkCountsInTopic = usuariosEnEsteTema.map(userID => ({ userID, count: (talkCounts.get(temaID) && talkCounts.get(temaID).get(userID)) || 0 }));

            // Obtener el máximo valor de mensajes (count) entre todos los usuarios en el tema
            const maxMessageCount = Math.max(...talkCountsInTopic.map(user => user.count));

            // Igualar el recuento de mensajes de todos los usuarios en este tema al valor máximo
            usuariosEnEsteTema.forEach(userID => {
              if (talkCounts.has(temaID)) {
                talkCounts.get(temaID).set(userID, maxMessageCount);
              }
            });
                
            if (temaID) 
            {
                const tema = temas.get(temaID);

                if (maxMessageCount >= 2) 
                {
                    if (tema && owners.includes(message.author)) 
                    {
                      const usuariosEnEsteTema = [...new Set([...owners.map(owner => owner.id), ...usuariosEnTemas.keys()])];
                    
                      // Eliminar el registro del tema y su estado
                      temas.delete(temaID);
                    
                      // Eliminar al autor y otros usuarios del tema
                      usuariosEnTemas.forEach((value, key) => {
                        if (value === temaID) {
                          usuariosEnTemas.delete(key);
                          }
                        });
                      
                        // Eliminar los registros de usos de !talk del autor y otros usuarios
                        if (talkCounts.has(temaID)) {
                          usuariosEnEsteTema.forEach(userID => {
                            talkCounts.get(temaID).delete(userID);
                          });
                        }

                        owners.forEach(owner => talkCounts.delete(owner.id));

                        talkCounts.delete(message.author.id);

                        OpenToCall = 2;
                        RestartFun(true)

                        const temaCreadorID = temaID.split('_')[0];

                        if (TemaTituloUsuarios.has(temaCreadorID))
                        {
                          const valorActual = TemaLengthUsuarios.get(temaCreadorID);
                          SizeOfTopic = valorActual
      
                          const TemaIDCreation = TemaIDUsuarios.get(temaCreadorID);
                          TemaIDNormal = TemaIDCreation
      
                          const TemaAlmacenado = TemaTituloUsuarios.get(temaCreadorID);
                          RealTemaName = TemaAlmacenado
                        }

                        if (Lenguaje == "English")
                        {
                          message.reply('The topic has been closed.');
                        }
                        else
                        if (Lenguaje == "Español")
                        {
                          message.reply('El tema ha sido cerrado.');
                        }
                    }
                    else 
                    {
                      if (Lenguaje == "English")
                      {
                        message.reply('You do not have permission to close the topic or you are not the owner.');
                      }
                      else
                      if (Lenguaje == "Español")
                      {
                        message.reply('No tienes permiso para cerrar el tema o no eres el dueño.');
                      }
                    }
                  }
                  else
                  if (Lenguaje == "English")
                  {
                    if (maxMessageCount == NaN)
                    {
                      message.reply(`You have registered (0 / 2) messages.`);
                    }
                    else
                    {
                      message.reply(`You have registered (${maxMessageCount} / 2) messages.`);
                    }
                  }
                  else
                  if (Lenguaje == "Español")
                  {
                    if (maxMessageCount == NaN)
                    {
                      message.reply(`Has registrado (0 / 2) mensajes.`);
                    }
                    else
                    {
                      message.reply(`Has registrado (${maxMessageCount} / 2) mensajes.`);
                    } 
                  }
                }
                else
                {
                  if (Lenguaje == "English")
                  {
                    message.reply('You are not in a topic to close.');
                  }
                  else
                  if (Lenguaje == "Español")
                  {
                    message.reply('No estás en un tema para cerrar.');
                  }
                }
          }
          else
          if (args[0].toLowerCase() === 'cancel') 
          {

              const temaID = usuariosEnTemas.get(message.author.id);
              const temaCreadorID = temaID.split('_')[0];
              
              if (temaID) 
              {
                const tema = temas.get(temaID);
            
                if (tema && owners.includes(message.author)) 
                {
                  const usuariosEnEsteTema = [...new Set([...owners.map(owner => owner.id), ...usuariosEnTemas.keys()])];
                  

                    // Eliminar al autor y otros usuarios del tema
                    usuariosEnTemas.forEach((value, key) => {
                      if (value === temaID) {
                        usuariosEnTemas.delete(key);
                      }
                    });
    
                    // Eliminar los registros de usos de !talk del autor y otros usuarios
                    if (talkCounts.has(temaID)) {
                      usuariosEnEsteTema.forEach(userID => {
                        talkCounts.get(temaID).delete(userID);
                      });
                    }

              

                  // Eliminar el registro del tema y su estado
                  temas.delete(temaID);
                  
                  // Eliminar al autor y otros usuarios del tema
                  usuariosEnTemas.forEach((value, key) => {
                      if (value === temaID) {
                      usuariosEnTemas.delete(key);
                      }
                  });
                  
                  // Eliminar los registros de usos de !talk del autor y otros usuarios
                  if (talkCounts.has(temaID)) {
                    usuariosEnEsteTema.forEach(userID => {
                    talkCounts.get(temaID).delete(userID);
                    });
                  }

                  if (Lenguaje == "English")
                  {
                    message.reply('Topic successfully cancelled.');
                  }
                  else
                  if (Lenguaje == "Español")
                  {
                    message.reply('Tema cancelado correctamente.');
                  }

                  if (TemaTituloUsuarios.has(temaCreadorID))
                  {
                    const TemaAlmacenado = TemaTituloUsuarios.get(temaCreadorID);
                    TemaLengthUsuarios.set(temaCreadorID, 1);
                    RealTemaName = TemaAlmacenado
      
                    const valorActualID = TemaIDUsuarios.get(temaCreadorID);
                    TemaIDNormal = valorActualID
                  }

                  OpenToCall = 3;
                  RestartFun(true)
                }
                else
                {
                  if (Lenguaje == "English")
                  {
                    message.reply('You do not have permission to close the topic or you are not the owner.');
                  }
                  else
                  if (Lenguaje == "Español")
                  {
                    message.reply('No tienes permiso para cerrar el tema o no eres el dueño.');
                  }
                }
              } 
              else
              {
                if (Lenguaje == "English")
                {
                  message.reply('You do not have a topic to cancel at this time.');
                }
                else
                if (Lenguaje == "Español")
                {
                  message.reply('No tienes un tema para cancelar en este momento.');
                }
              }
          }
          else
          {
            if (Lenguaje == "English")
            {
              message.reply('You must specify a subcommand (open, status, close, cancel) for the !topic command.');
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('Debes especificar un subcomando (open, status, close, cancel) para el comando !topic.');
            }
          }
        }
        else
        if (command == 'talk') 
        {
          var character = args.shift(); // Obtener el nombre del personaje
          CharacterToTalk = character;
          const temaID = usuariosEnTemas.get(message.author.id);

          if (temaID) 
          {
              const tema = temas.get(temaID);
              if (tema && tema.abierto) 
              {
                  if (character) 
                  {
                      var messageContent = args.join(' '); // Obtener el contenido del mensaje
                      if (messageContent)
                      {
                          if (messageContent.length > 1000) 
                          {
                            if (Lenguaje == "English")
                            {
                              message.reply('Message exceeds 1000 characters.');
                            }
                            else
                            if (Lenguaje == "Español")
                            {
                              message.reply('El mensaje excede los 1000 caracteres.');
                            }
                          } 
                          else
                          if (messageContent.length <= 1000)
                          {
                            OpenToCall = 5;

                            mesTex = messageContent;
                            Chara = CharacterToTalk;

                            // Registrar el mensaje del usuario en el tema
                            tema.messages = tema.messages || [];
                            tema.messages.push(`${message.author.username}: ${message.content}`);

                            // Incrementar el contador de usos de !talk para el usuario
                            if (!talkCounts.has(temaID)) 
                            {
                              talkCounts.set(temaID, new Map());
                            }

                            const temaCreadorID = temaID.split('_')[0]; // Extraer el ID del creador del tema

                            if (TemaTituloUsuarios.has(temaCreadorID))
                            {
                              const TemaAlmacenado = TemaTituloUsuarios.get(temaCreadorID);
                              const valorActual = TemaLengthUsuarios.get(temaCreadorID);
                              TemaLengthUsuarios.set(temaCreadorID, valorActual + ValorASumar);
                              
                              SizeOfTopic  = valorActual
                              RealTemaName = TemaAlmacenado

                              const TemaIDCreation = TemaIDUsuarios.get(temaCreadorID);
                              TemaIDNormal = TemaIDCreation
                            }
                            
                            const talkCount = talkCounts.get(temaID).get(message.author.id) || 0;
                            talkCounts.get(temaID).set(message.author.id, talkCount + 1);
                          }
                      } 
                      else 
                      {
                        if (Lenguaje == "English")
                        {
                          message.reply('Add a message.');
                        }
                        else
                        if (Lenguaje == "Español")
                        {
                          message.reply('Añade un mensaje.');
                        }
                      }
                  }
                  else 
                  {
                    if (Lenguaje == "English")
                    {
                      message.reply('Add a character.\n**-Character list-**\n' + Names);
                    }
                    else
                    if (Lenguaje == "Español")
                    {
                      message.reply('Añade un personaje.\n**-Lista de personajes-**\n' + Names);
                    }
                  }
              }
              else
              {
                if (Lenguaje == "English")
                {
                  message.reply('You must be in an open topic to use this command.');
                }
                else
                if (Lenguaje == "Español")
                {
                  message.reply('Debes estar en un tema abierto para usar este comando.');
                }
              }
          } 
          else
          {
            if (Lenguaje == "English")
            {
              message.reply('You are not on a topic to use this command.');
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('No estás en un tema para usar este comando.');
            }
          }
        }
        else
        if (command == 'language')
        {
          if (args.length === 0) 
          {
            if (Lenguaje == "English")
            {
              message.reply('Select you language...\n**English** or **Spanish**.\n\nExample: !language ESP')
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('Selecciona un idioma...\n**Ingles** o **Español**.\n\nEjemplo: !language ENG')
            }
          } 
          else 
          if (args[0].toLocaleUpperCase() === 'ENG')
          {
              if (temas.size === 0) 
              {
                OpenToCallLan = true
                Lenguaje = "English"
                SelectedLan = "English"
                message.reply("Language Selected: English") 
              }
              else
              {
                if (Lenguaje == "English")
                {message.reply("You Can't Select Languages during the open topic.") }
                else
                if (Lenguaje == "Español")
                {message.reply("No se puedes seleccionar idiomas durante el tema abierto.") }
              }
          } 
          else 
          if (args[0].toLocaleUpperCase() === 'ESP')
          {
            if (temas.size === 0) 
            {
              OpenToCallLan = true
              Lenguaje = "Español"
              SelectedLan = "Español"
              message.reply("Idioma seleccionado: Español")
            }
            else
            {
              if (Lenguaje == "English")
              {message.reply("You Can't Select Languages during the open topic.") }
              else
              if (Lenguaje == "Español")
              {message.reply("No se puedes seleccionar idiomas durante el tema abierto.") }
            }
          }
          else
          {
            if (Lenguaje == "English")
            {
              message.reply('Invalid Language.')
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('Idioma Invalido.')
            }
          }
        }
        else
        if (command === 'join') 
        {
          const mentionedUser = message.mentions.users.first(); // Obtener el usuario mencionado
    
          if (mentionedUser) 
          {
            const temaID = usuariosEnTemas.get(mentionedUser.id);
            if (temaID) 
            {
              // Verificar si el usuario mencionado está en un tema
              if (!usuariosEnTemas.has(message.author.id)) 
              {
                const talkCount = talkCounts.get(mentionedUser.id); // Obtener el contador actual o establecerlo en 0
                // Para cerrar el tema, establece el contador de usos de !talk en 2 o más
                talkCounts.set(message.author.id, talkCount); // Incrementar el contador en 1

                usuariosEnTemas.set(message.author.id, temaID); // Registrar al usuario en el mismo tema que el mencionado
                
                const temaCreadorID = temaID.split('_')[0];
                
                if (TemaTituloUsuarios.has(temaCreadorID)) 
                {
                  const TemaAlmacenado = TemaTituloUsuarios.get(temaCreadorID);
                  const valorActual = TemaLengthUsuarios.get(temaCreadorID);
                  const TemaIDCreation = TemaIDUsuarios.get(temaCreadorID);
      
                  // Actualizar las variables
                  SizeOfTopic = valorActual;
                  RealTemaName = TemaAlmacenado;
                  TemaIDNormal = TemaIDCreation;
                }

                if (Lenguaje == "English")
                {
                  message.reply(`You have joined the topic together with ${mentionedUser.username}`);
                }
                else
                if (Lenguaje == "Español")
                {
                  message.reply(`Te has unido al tema junto a ${mentionedUser.username}`);
                }
              } 
              else 
              {
                if (Lenguaje == "English")
                {
                  message.reply('You are already joined to a topic.');
                }
                else
                if (Lenguaje == "Español")
                {
                  message.reply('Ya estás unido a un tema.');
                }
              }
            } 
            else 
            {
              if (Lenguaje == "English")
              {
                message.reply('The named person is not in a topic.');
              }
              else
              if (Lenguaje == "Español")
              {
                message.reply('La persona mencionada no está en un tema.');
              }
            }
          }
          else 
          {
            if (Lenguaje == "English")
            {
              message.reply('You must mention the person you wish to join the topic with.')
            }
            else
            if (Lenguaje == "Español")
            {
              message.reply('Debes mencionar a la persona con la que deseas unirte al tema.');
            }
          }
        } 
    }
})


wss.on("connection", ws => 
{
  clientID++
  console.log("Reconnected "+clientID+" Times");

    ws.on("message", data => 
    {
        var realData = JSON.parse(data);
        var eventName = realData.eventName;
        switch(eventName)
        {
            case "Connected_Server":
              console.log("Connected")
            break;
            case "Send_Language":
              if (OpenToCallLan == true)
              {
                  if (SelectedLan == "English")
                  {
                      console.log("Cambio de español a ingles")
                      CharLan = "English";
                  }
                  else
                  if (SelectedLan == "Español")
                  {
                      console.log("Cambio de ingles a español")
                      CharLan = "Español";
                  }

                  ws.send(
                    JSON.stringify({
                      eventName: "Send_Language",
                      language: CharLan
                    }
                    ));
                    console.log("Send Language")
                    OpenToCallLan = false;
              }
            break;
            case "Send_Topic":
              if (OpenToCall == true)
              {
                CheckTopic = 0;

                if (mesCon != MESSAGE){MESSAGE = mesCon}

                var Topic_send = {
                  id: clientID,
                  message_topic: RealTemaName,
                  topic_length: SizeOfTopic,
                  topic_id_real: TemaIDNormal
                }

                Messages.push(Topic_send)
                
                ws.send(
                  JSON.stringify({
                    eventName: "Send_Topic",
                    id: clientID,
                    message_topic: RealTemaName,
                    topic_length: SizeOfTopic,
                    topic_id_real: TemaIDNormal
                  }
                  ));

                  console.log("Send Topic");
                  OpenToCall = false
              }
            break;
            case "Send_Message":
              if (OpenToCall == 5) {
                if (CharacterToTalk != Chara) {
                  CharacterToTalk = Chara;
                }
                if (mesTex != MESSAGE) {
                  MESSAGE = mesTex;
                }

                var Messages_send = {
                  id: clientID,
                  message_nick: Chara,
                  message_text: mesTex,
                  message_topic: RealTemaName,
                  topic_length: SizeOfTopic,
                  topic_id_real: TemaIDNormal
                };

                Messages.push(Messages_send);

                ws.send(
                  JSON.stringify({
                    eventName: "Send_Message",
                    id: clientID,
                    message_nick: Chara,
                    message_text: mesTex,
                    message_topic: RealTemaName,
                    topic_length: SizeOfTopic,
                    topic_id_real: TemaIDNormal
                  })
                );

                console.log("Send Message");
                OpenToCall = false;
                }
            break;
            case "Close_Topic":
              if (OpenToCall == 2)
              {
                var Messages_send = {
                  changeNumber: CheckTopic,
                  message_topic: RealTemaName,
                  size_to_finish: SizeOfTopic,
                  topic_id_real: TemaIDNormal
                };

                Messages.push(Messages_send);

                  ws.send(
                    JSON.stringify({
                      eventName: "Close_Topic",
                      changeNumber: CheckTopic, 
                      message_topic: RealTemaName,
                      size_to_finish: SizeOfTopic,
                      topic_id_real: TemaIDNormal
                    }));          

                  // Después de cerrar un tema
                  SizeOfTopic = 0; // Reiniciar el tamaño del tema
                  RealTemaName = ""; // Reiniciar el nombre del tema
                  TemaIDNormal = ""; // Reiniciar el ID del tema

                  console.log("Close Topic")
                  OpenToCall = 4;
              }
            break;
            case "Cancel_Topic":
              if (OpenToCall == 3)
              {
                  ws.send(
                    JSON.stringify({
                      eventName: "Cancel_Topic",
                      message_topic: RealTemaName,
                      changeNumber: CheckTopic,
                      topic_id_real: TemaIDNormal
                    }));          

                  console.log("Cancel Topic")
                  OpenToCall = 4;
              }
            break;
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

app.post('/send-info', (req, res) => {
    const data = req.body; // Datos enviados desde Discord.js
    // Procesar la información aquí
    res.send('Information received and successfully processed');
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
        CheckTopic = 1  
        Active = false
    }
}
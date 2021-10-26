const express = require("express");
const pool = require("./database/database");
const app = express();
const http = require("http");
const server = http.createServer(app);
var cors = require("cors");
const { Server } = require("socket.io");
const io = new Server(server, {
  cors: {
    origin: "*",
  },
});
const port = 8000;
let shared_peer = null
// let screenshare = false

app.use("*", cors());

io.on("connection", (socket) => {
  console.log("a user connected");
  pool.query(`select * from members where sharing_status=?`, 1, (er, re) => {
    if (er) {
      console.log(er, "aaassddcc")
    } else {
      if (re.length > 0) {
        socket.emit("screenshareon", true, re[0].Screen_share_peer)
      }
    }
  })
  pool.query(`select * from members where user_id=?`, socket.handshake.query["user_id"], (err, res) => {
    if (err) {
      console.log(err)
    }
    else {
      socket.to(shared_peer).emit("NewUser", res[0])
    }
  })
  pool.query(`select * from users where id=?`, socket.handshake.query["user_id"], (err, res) => {
    if (err) {
      console.log(err)
    }
    else {
      socket.emit("My_details", res[0])
    }
  })
  // get all members from meeting
  pool.query(
    "select *  from members where meeting_id=?",
    [socket.handshake.query["meetingid"]],
    (err, res) => {
      if (err) {
        console.log(err, "asdlkalaskd");
      } else {
        // console.log(res, "aaaallll");
      }
    }
  );
  //
  socket.on("connect_meeting", (e) => {
    // console.log("connecting...")
    pool.query(
      `select * from members where user_id=? and meeting_id=?`,
      [e.userid, e.meetingid],
      (err, res) => {
        if (err) {
          console.log(err, "hhhhhhhhh");
        } else {
          console.log(res[0])
          if (res.length == 0) {
            pool.query(
              `INSERT INTO members(user_id,meeting_id,time,status,peer_id,socket_id) VALUES (?,?,?,?,?,?)`,
              [e.userid, e.meetingid, e.time, e.status, e.peerid, socket.id],
              (error, ress) => {
                if (error) {
                  console.log(err);
                } else {
                  socket.join(e.meetingid);
                  console.log("room connected");
                  pool.query(
                    `SELECT members.id,members.user_id,members.meeting_id,members.time,.members.status,members.peer_id,members.Screen_share_peer,members.socket_id,members.Sharing_status,users.name,users.profile_pic,users.account_type FROM members INNER JOIN users on members.user_id = users.id where members.status=1 and members.meeting_id=1`,
                    [e.meetingid],
                    (er, re) => {
                      if (er) {
                        console.log(er);
                      } else {
                        io.to(e.meetingid).emit("User_Connected", re);
                        socket.to(socket.id).emit('call', re)
                      }
                    }
                  );
                }
              }
            );
          } else {
            socket.join(e.meetingid);
            // io.to(e.meetingid).emit("User_Connected", connids);
            console.log("room connected");
            pool.query(
              `update members set peer_id=?,status=1,socket_id=? where user_id=?`,
              [e.peerid, socket.id, e.userid],
              (errr, result) => {
                if (errr) {
                  console.log(errr, "jj");
                } else {
                  pool.query(
                    `SELECT members.id,members.user_id,members.meeting_id,members.time,.members.status,members.peer_id,members.Screen_share_peer,members.socket_id,members.Sharing_status,users.name,users.profile_pic,users.account_type FROM members INNER JOIN users on members.user_id = users.id where members.status=1 and members.meeting_id=1`,
                    [e.meetingid],
                    (er, re) => {
                      if (er) {
                        console.log(er);
                      } else {
                        io.to(e.meetingid).emit("User_Connected", re);
                        // socket.emit("peer_id", re[0].peer_id);

                        socket.emit('call', re)
                        // console.log(re, "lllllllll");
                      }
                    }
                  );
                }
              }
            );
            // console.log("room connected");
          }
        }
      }
    );
  });
  socket.on("connect_screen", (e) => {
    // console.log("connecting...")
    pool.query(
      `select * from members where user_id=? and meeting_id=?`,
      [e.userid, e.meetingid],
      (err, res) => {
        if (err) {
          console.log(err, "hhhhhhhhh");
        } else {
          console.log(res[0])

          if (res.length == 0) {
            pool.query(
              `INSERT INTO members(user_id,meeting_id,time,status,Screen_share_peer) VALUES (?,?,?,?,?)`,
              [e.userid, e.meetingid, e.time, e.status, e.screensharepeer],
              (error, ress) => {
                if (error) {
                  console.log(err);
                } else {
                  pool.query(
                    `select * from members where status=1 and meeting_id=?`,
                    [e.meetingid],
                    (er, re) => {
                      if (er) {
                        console.log(er);
                      } else {
                        io.to(e.meetingid).emit("Users_Screen", re);
                        // socket.emit("peer_id", re[0].peer_id);
                        socket.to(socket.id).emit('Screensharecall', re)
                        // console.log(re, "lllllllll");
                      }
                    }
                  );
                }
              }
            );
          } else {
            socket.join(e.meetingid);
            // io.to(e.meetingid).emit("User_Connected", connids);
            console.log("room connected");
            pool.query(
              `update members set Screen_share_peer=?,status=1 where user_id=?`,
              [e.screensharepeer, e.userid],
              (errr, result) => {
                if (errr) {
                  console.log(errr, "jj");
                } else {
                  pool.query(
                    `select * from members where status=1 and meeting_id=?`,
                    [e.meetingid],
                    (er, re) => {
                      if (er) {
                        console.log(er);
                      } else {
                        io.to(e.meetingid).emit("Users_Screen", re);
                        // socket.emit("peer_id", re[0].peer_id);

                        socket.emit('Screensharecall', re)
                        // console.log(re, "lllllllll");
                      }
                    }
                  );
                }
              }
            );
          }
        }
      }
    );
  });
  socket.on("message", (e) => {
    // console.log(socket.rooms, 'aassccc')
    // console.log(String(e.room));
    socket.to(String(e.room)).emit("get_messsage", e);
  });

  socket.on("Screenshare", (e, status) => {
    console.log(e, status, 'asssccc')
    shared_peer = socket.id
    pool.query(`update members set Sharing_status=1 where socket_id=?`, socket.id)
    io.to(e.room).emit("getScreenshare", e)
    console.log("step 2 sharing")
  })

  socket.on("disconnect", (e) => {
    console.log(e)
    changestate(socket.id)
    console.log("user disconnected");
  });

  function changestate(userid, meetingid) {
    pool.query(
      `update members set status=0,Sharing_status=0 where socket_id=?`,
      [userid, meetingid],
      (errr, result) => {
        if (errr) {
          console.log(errr, "jj");
        } else {
          console.log(result)
        }
      }
    );
  }
});

// pool.connect(function (err) {
//   if (err) {
//     console.log(err);
//   }
// });

server.listen(port, () => {
  console.log(`App started on ${port}!`);
});
// require('dotenv').config();
// const express = require("express");
// const http = require("http");
// const app = express();
// const server = http.createServer(app);
// // const socket = require("socket.io");
// var cors = require("cors"); 
// const { Server } = require("socket.io");
//  const io = new Server(server, {
//  cors: {
//     origin: "*",
//     methods: ["GET", "POST"],
//     transports: ['websocket', 'polling'],
//     credentials: true
//   },
//   allowEIO3: true
// });
// app.use("*", cors());
// const users = {};

// const socketToRoom = {};

// io.on('connection', socket => {
//     socket.on("join room", roomID => {
//         // console.log("hiiii")
//         if (users[roomID]) {
//             const length = users[roomID].length;
//             if (length === 4) {
//                 socket.emit("room full");
//                 return;
//             }
//             users[roomID].push(socket.id);
//         } else {
//             users[roomID] = [socket.id];
//         }
//         socketToRoom[socket.id] = roomID;
//         const usersInThisRoom = users[roomID].filter(id => id !== socket.id);

//         socket.emit("all users", usersInThisRoom);
//     });

//     socket.on("sending signal", payload => {
//         // console.log("hiiii")
//         io.to(payload.userToSignal).emit('user joined', { signal: payload.signal, callerID: payload.callerID });
//     });

//     socket.on("returning signal", payload => {
//         // console.log(payload)
//         io.to(payload.callerID).emit('receiving returned signal', { signal: payload.signal, id: socket.id });
//     });

//     socket.on('disconnect', () => {
//         const roomID = socketToRoom[socket.id];
//         let room = users[roomID];
//         if (room) {
//             room = room.filter(id => id !== socket.id);
//             users[roomID] = room;
//         }
//     });

// });

// server.listen(8000, () => console.log('server is running on port 8000'));



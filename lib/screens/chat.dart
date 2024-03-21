import 'dart:convert';
import 'package:ajnabee/models/chat_model.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class chatPage extends StatefulWidget {
  const chatPage({Key? key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  late IO.Socket socket;
  List<ChatModel> chatMessages = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    connectToServer();
  }

  void connectToServer() {
    print("conn to server ran");

    socket = IO.io('http://192.168.1.40:3000/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'reconnect': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
      'forceNew': true,
    });

    socket.on('connect', (_) {
      print('Connected to server');
    });

    socket.on('message', (data) {
      ChatModel chatModel = ChatModel.fromJson(jsonDecode(data));
      setState(() {
        chatMessages.add(chatModel);
      });
    });

    socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
  }

  void _sendMessage() {
    final message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      // Create a chatModel object with the message
      final chatModel = {
        'id': 0,
        'message': message,
      };
      // Convert the chatModel object to a JSON string
      final jsonMessage = json.encode(chatModel);
      // Emit a message event with the JSON message
      socket.emit('message', jsonMessage);
      _textEditingController.clear();
    }
  }

  @override
  void dispose() {
    // Disconnect the socket when the widget is disposed
    if (socket != null) {
      socket.disconnect();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(255, 214, 0, 1),
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/stories/Story 1.png',
              height: 32,
              width: 32,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plush Beauty Lounge',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(255, 214, 0, 1),
                    fontFamily: 'Nunito Sans',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call_rounded,
                  color: Color.fromRGBO(255, 214, 0, 1),
                )),
            SizedBox(
              width: 1,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_rounded,
                  color: Color.fromRGBO(255, 214, 0, 1),
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ChatMessageContainer(
                          message: chatMessages[index].message,
                          isSentByMe:
                              (chatMessages[index].id == 0) ? true : false),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Column(
              //         // Messages go here
              //         children: [
              //           SizedBox(
              //             height: 10,
              //           ),
              //           ChatMessageContainer(
              //               message: 'Hello, good morning :)',
              //               isSentByMe: true),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 '11:20',
              //                 style: TextStyle(
              //                   color: Color.fromRGBO(173, 179, 188, 1),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           ChatMessageContainer(
              //               message: 'Good morning', isSentByMe: false),
              //         ]),
              //   ),
              // ),
              Divider(
                  height: 1, color: Colors.grey), // Divider for message section
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Attach files action
                    },
                    icon: Icon(Icons.attach_file),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 243, 246, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Color.fromRGBO(173, 179, 188, 1),
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(255, 214, 0, 1),
                    child: IconButton(
                      onPressed: _sendMessage,
                      icon: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageContainer extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatMessageContainer({
    Key? key,
    required this.message,
    required this.isSentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: isSentByMe ? 8 : 0,
        right: isSentByMe ? 5 : 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/stories/Story 1.png'),
              ),
            ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSentByMe
                  ? Color.fromRGBO(225, 245, 250, 1)
                  : Color.fromRGBO(255, 214, 0, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              softWrap: true,
              style: TextStyle(
                fontSize: 14,
                color: isSentByMe ? Colors.black : Colors.black87,
                fontFamily: 'Manrope',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

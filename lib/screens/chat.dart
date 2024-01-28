import 'package:flutter/material.dart';
class chatPage extends StatelessWidget{
  const chatPage({Key?key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){

        }, icon: Icon(Icons.arrow_back_ios,
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
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Plush Beauty Lounge',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                ),
                Text('Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(255, 214, 0, 1),
                    fontFamily: 'Nunito Sans',
                  ),
                ),

              ],

            ),
            SizedBox(width: 10,),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.call_rounded,
            color: Color.fromRGBO(255, 214, 0, 1),)),
            SizedBox(width: 1,),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.menu_rounded,
            color: Color.fromRGBO(255, 214, 0, 1),)),
            
            
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 10,),
            ChatMessageContainer(
              message: 'Hello, good morning :)', 
              isSentByMe: true
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 5,),
                Text('11:20',
                style: TextStyle(
                  color: Color.fromRGBO(173, 179, 188, 1),
                ),),
                
              ],
            ),
            ChatMessageContainer(
              message: 'Good morning, anything we can help at Plush Beauty Longue Salon?', 
              isSentByMe: false
            ),
          ],
        ),
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
                  : Color.fromRGBO(255 , 214, 0, 1),
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


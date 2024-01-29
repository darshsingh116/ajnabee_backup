import 'package:flutter/material.dart';

class MessageNotifications extends StatefulWidget {
  const MessageNotifications({Key? key}) : super(key: key);

  @override
  _MessageNotificationsState createState() => _MessageNotificationsState();
}

class _MessageNotificationsState extends State<MessageNotifications> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              _buildTab(0, 'Messages'),
              _buildTab(1, 'Notifications'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Screen for Tab 1
                  Center(
                    child: Column(
                      children: [
                        buildmessagecontainer(
                            'Plush Beauty Lounge', 'Good morning, anything we ca', '11:32 PM', 2, 'assets/stories/Story 2.png'),
                        buildmessagecontainer(
                            'Lovely Lather', 'Good morning, anything we ca', '11:40 PM', 5, 'assets/stories/Story 4.png')
                      ],
                    ),
                  ),

                  // Screen for Tab 2
                  Center(
                    child: Text('Screen for Tab 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String text) {
    bool isSelected = _selectedTabIndex == index;

    return Tab(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.yellow : Color.fromRGBO(173, 179, 188, 1),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                color: Colors.yellow,
              ),
            ),
        ],
      ),
    );
  }

Widget buildmessagecontainer(String sender, String message, String time, int unreadCount, String profileImage) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 1,),
                Text(
                  message,
                  style: TextStyle(
                    color: Color.fromRGBO(80, 85, 92, 1),
                    fontFamily: 'Nunito Sans',
                    fontSize: 14,
                  ),
                )
              ],
            ),
            SizedBox(width: 3,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                  ),
                ),
                SizedBox(height: 1,),
                _buildUnreadCountBadge(unreadCount),
              ],
            )
          ],
        ),
      ),
      Divider(
        color: Color.fromRGBO(209, 213, 219, 1),
        thickness: 0.3,
        height: 0,
        
      ),
    ],
  );
}


  Widget _buildUnreadCountBadge(int count) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(249, 134, 0, 1),
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }
}

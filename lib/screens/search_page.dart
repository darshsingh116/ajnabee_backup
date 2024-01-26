import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({Key?key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            // Add your settings icon functionality here
          },
        ),
        title: Text("Search",
        style: TextStyle(
          color: Color.fromRGBO(17, 17, 17, 1),
          fontFamily: 'Manrope',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          ),

        ),
        centerTitle :true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Color.fromRGBO(255, 214, 0, 1),),
            onPressed: () {
              _showfilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFFFFDA19),
                  ),
                  SizedBox(width: 8.0,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search salon or service..'
                      ),
                    ))
              
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recents',
                    style: TextStyle(
                      color: Color.fromRGBO(93, 110, 110, 1),
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Clear All',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 214, 0, 1),
                      fontFamily: 'Manrope',
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
        
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hair service',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.close_sharp,
                    color: Color(0x5D646E),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nail',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: Color(0x5D646E),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wax',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.cancel_sharp,
                    color: Color(0x5D646E),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Text(
                  'Popular Search',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Row(
              children: [
                PopSearchContainer(text: 'Hair'),
                PopSearchContainer(text: 'Nails'),
                PopSearchContainer(text: 'Coloring'),
              ],
            ),
            Row(
              children: [
                PopSearchContainer(text: 'Massage'),
                PopSearchContainer(text: 'Facials'),
                
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Text(
                  'Suggestion for you',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
        
        
        
        
        
          ],
        ),
      ),

    );
  }
  Widget PopSearchContainer({required String text}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 88,
      height: 32,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(225, 245, 250, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(255, 214, 0, 1),
              fontSize: 12,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
  void _showfilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ClipRRect(
             borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Container(
              height: 900,
              width: 800,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left : 16.0),
                          child: Text(
                            'cancel',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 214, 0, 1),
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Color.fromRGBO(17, 17,17, 1),
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              color: Color.fromRGBO(237,76,92, 1),
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(
                        'Available on',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal :16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: const Color.fromRGBO(255, 214, 0, 1),
                          ),
                          Text('September,2023',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
              
                          ),),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromRGBO(255, 214, 0, 1),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DateContainer(text: 'Wed', number: 9),
                          SizedBox(width: 5,),
                          DateContainerYellow(text: 'Thu', number: 10),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Fri', number: 11),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Sat', number: 12),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Sun', number: 13),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Mon', number: 14),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Tue', number: 11),
                          SizedBox(width: 5,),
                          DateContainer(text: 'Fri', number: 11),
                        ],
                        
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Service',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
              
              
                      ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ServiceContainer(text:'Hair'),
                        SizedBox(width: 2,),
                        ServiceContainer(text: 'Nails'),
                        SizedBox(width: 2,),
                        ServiceContainerWhite(text: 'Coloring'),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ServiceContainerWhite(text:'Massage'),
                        SizedBox(width: 2,),
                        ServiceContainerWhite(text: 'Facials'),
                        SizedBox(width: 2,),
                        ServiceContainerWhite(text: 'Waxing'),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ServiceContainerWhite(text:'Coloring'),
                        SizedBox(width: 2,),
                        ServiceContainerWhite(text: 'Makeup'),
                        SizedBox(width: 2,),
                        ServiceContainerWhite(text: 'Spa'),
                        
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Rating',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
              
              
                      ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: const Color.fromRGBO(255, 214, 0, 1),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.star_rate_rounded,
                        color: const Color.fromRGBO(255, 214, 0, 1),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.star_rate_rounded,
                        color: const Color.fromRGBO(255, 214, 0, 1),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.star_rate_rounded,
                        color: const Color.fromRGBO(255, 214, 0, 1),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.star_rate_rounded,
                        color: const Color.fromRGBO(209, 213, 219, 1),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '4 star',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 214, 0, 1),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
              
                        ),
                      ),
              
                    ]),
                          
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Service for',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
              
              
                      ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ServiceContainer(text: 'All'),
                        SizedBox(width:1,),
                        ServiceContainerWhite(text: 'Woman'),
                        
                        
                        
                      ],),
                      
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget DateContainer({required String text,required int number}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 55,
      height: 77,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 243, 246, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(17, 17, 17, 1),
              fontSize: 12,
              fontFamily: 'Nunito Sans',
              
              
            ),
          ),
          SizedBox(height: 4,),
          Text(
            number.toString(),
            style: TextStyle(
              color: Color.fromRGBO(17, 17, 17, 1),
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
    Widget DateContainerYellow({required String text,required int number}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 55,
      height: 77,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 214, 0, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(240, 243,246, 1),
              fontSize: 12,
              fontFamily: 'Nunito Sans',
              
              
            ),
          ),
          SizedBox(height: 4,),
          Text(
            number.toString(),
            style: TextStyle(
              color: const Color.fromRGBO(240, 243,246, 1),
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
  Widget ServiceContainer({required String text}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 88,
      height: 32,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 242, 174, 1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Color.fromRGBO(255, 214, 0, 1),
          width: 1,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(17, 17, 17, 1),
              fontSize: 12,
              fontFamily: 'Manrope',
              
              
            ),
          ),
          
        ],
      ),
    );
  }
    Widget ServiceContainerWhite({required String text}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 88,
      height: 32,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Color.fromRGBO(17, 17, 17, 1),
          width: 1,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(17, 17, 17, 1),
              fontSize: 12,
              fontFamily: 'Manrope',
              
              
            ),
          ),
          
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 214, 0, 1),
      body: Stack(
        children: [
          // Carousel at the upper part of the screen
          Positioned(
            top: 28,
            left: 20,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          // Positioned Container at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 550,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 75),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter your card details to proceed with the payment.',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 348,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 214, 0, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Number',
                            style: TextStyle(
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 52,
                            width: 293,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter card number',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Name on Card',
                            style: TextStyle(
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 52,
                            width: 293,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Name',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CVV',
                                    style: TextStyle(
                                      fontFamily: 'Inria Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    height: 52,
                                    width: 137.57,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: 'Enter your CVV',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expiry Date',
                                    style: TextStyle(
                                      fontFamily: 'Inria Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    height: 52,
                                    width: 137.57,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                        
                      ),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top:10),
                    child: Row(
                      children:[
                        Container(
                          height: 8,
                          child: Switch(
                            value: true, 
                            onChanged: (value) {
                              
                            },
                            inactiveTrackColor: Colors.white ,
                            activeTrackColor: const Color.fromRGBO(255, 214, 0, 1),
                            activeColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Securely Save Card and Details',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            
                            fontSize: 14,
                          ),
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 54,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 214, 0, 1),
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child: Row(
                            children: [
                              SizedBox(width:55),
                              Text('Add New Card',
                                style: TextStyle(
                                  
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                            ),),
                            Icon(Icons.arrow_forward),]),
                  )
                ],
                
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                autoPlay: false,
              ),
              items: [
                Image.asset('assets/cards/Card ajnabee.png'),
                Image.asset('assets/cards/66 - DESIGN CARD.png'),
              ],
            )
          )
        ]
      )
    );
  }
}

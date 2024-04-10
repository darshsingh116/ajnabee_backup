import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 214, 0, 1),
      body: Stack(
        children: [
          // Carousel at the upper part of the screen
          
          Positioned(
            top:28,
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
                    padding: const EdgeInsets.only(left: 30,top: 90),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Other Payment Methods',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  createRoundedContainer('Credit/Debit Card', Icons.credit_card),
                  SizedBox(height: 8,),
                  createRoundedContainer('Net Banking  ', Icons.account_balance_outlined),
                  SizedBox(height: 8,),
                  createRoundedContainer('Google Wallet  ', Icons.wallet_rounded),
                  SizedBox(height: 8,),
                  createRoundedContainer('PhonePe  ', Icons.money),
                  SizedBox(height: 80,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,top: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Total',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),),
                                Text('(1 Service)',
                                style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  
                                  fontSize: 14,
                                ),)
                              ],
                            ),
                            SizedBox(height: 2,),
                            Text('Rs 200',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 214, 0, 1),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                            ),),
                            SizedBox(height: 2,),
                            Text('View Details',
                                style: TextStyle(
                                  
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                            ),),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Container(
                          height:50,
                          width:200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(255, 214, 0, 1)),
                          child: Row(
                            children: [
                              SizedBox(width:55),
                              Text('Pay Now',
                                style: TextStyle(
                                  
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                            ),),
                            Icon(Icons.arrow_forward),
                            ],

                          ),
                          
                        )
                      ],
                    ),
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
            ),
          ),
        ],
      ),
    );
  }
  Widget createRoundedContainer(String text, IconData icon) {
    return Container(
      height: 52,
      width: 335,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 239, 239, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
               border: Border.all(color: Colors.black),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 16,),
              
              onPressed: () {
                
              },
            ),
          ),
        ],
      ),
    );
  }
}

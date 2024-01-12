import 'package:flutter/material.dart';

class SalonDetails extends StatelessWidget {
  const SalonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height, // Full screen height
            width: MediaQuery.of(context).size.width, // Full screen width
          ),
          child: Stack(
            children: [
              Positioned(
                // Add a top position to position the image
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset('assets/shop_details/shop.png'),
              ),
              Positioned(
                left: 20,
                top: 25,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: const Color.fromRGBO(255, 214, 0, 1),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 280,
                top: 25,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: const Color.fromRGBO(255, 0, 25, 1),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shahnaz Husain',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Connaught Place, New Delhi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: const Color.fromRGBO(255, 214, 0, 1),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '[Open Today]',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito Sans',
                          ),
                          
                        ),
                        const SizedBox(width:30,),
                        Icon(
                          Icons.local_offer,
                          color: const Color.fromRGBO(255, 0, 25, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '-58%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito Sans',
                            color: const Color.fromRGBO(255, 0, 25, 1),
                          ),
                          
                          
                        ),
                        Text(
                          '(6 pax available)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito Sans',
                            
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color.fromRGBO(249, 134, 0, 1),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.7',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito Sans',
                          ),
                          
                        ),
                        const SizedBox(width: 2,),
                        Text(
                          '(2.7k)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito Sans',
                          ),
                          
                        ),
                        const SizedBox(width:55,),
                        Icon(
                          Icons.visibility,
                          color: const Color.fromRGBO(93, 100, 110, 1),
                        ),
                        SizedBox(width: 5),
                        
                        Text(
                          '10k views',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito Sans',
                            
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      
                      thickness: 10, 
                      color: Colors.grey, 
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'About',
                      style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 10),
                     
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          "Keeping up to speed with the market's latest trends \n Plush Beauty Lounge recognizes the need for constant \nimprovements. Our team receives regular training from \n hairdressers all...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito Sans',
                            
                          ),
                          
                        ),
                        
                        Text(
                          'Read more',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito Sans'

                            
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'Opening Hours',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Manrope',
                            
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 214, 0, 1),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monday - Friday',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Nunito Sans',
                            
                              ),
                            ),
                            Text(
                              '08:00am - 03:00pm',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                            
                              ),
                            ),
                          ],

                        ),
                        const SizedBox(width: 30,),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 214, 0, 1),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saturday - Sunday',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Nunito Sans',
                            
                              ),
                            ),
                            Text(
                              '09:00am - 02:00pm',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                            
                              ),
                            ),
                            const SizedBox(height: 20,),

                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    
                    Text(
                      'Our Services',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Manrope',
                            
                      ),
                    ),
                    const SizedBox(height: 14,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Row(
                          children: [
                             _buildInterestContainer(
                              imagePath: "assets/categories/haircut.png",
                              text: "Haircut",
                            ),
                            const SizedBox(width:5),
                            _buildInterestContainer(
                              imagePath: "assets/categories/nails.png",
                              text: "Nails",
                            ),
                            const SizedBox(width : 5),
                            _buildInterestContainer(
                              imagePath: "assets/categories/facial.png",
                              text: "Facial",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/shop_details/services/medium_length_cut.png",
                          height: 114,
                          width: 114,
                        )
                      ],
                    )  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildInterestContainer({required String imagePath, required String text}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 146,
      height: 56,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(225, 255, 255, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Image.asset(
            imagePath,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(255, 214, 0, 1),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

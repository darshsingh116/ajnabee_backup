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
                left: 10,
                top: 8,
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
                top: 8,
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
                    Divider(
                      
                      thickness: 10, 
                      color: Colors.grey, 
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
}

import 'package:ajnabee/models/salon_model.dart';
import 'package:ajnabee/models/salon_services_model.dart';
import 'package:ajnabee/screens/salon_services_card.dart';
import 'package:flutter/material.dart';

class SalonDetails extends StatefulWidget {
  final SalonModel salonModel;

  const SalonDetails({super.key, required this.salonModel});

  @override
  State<SalonDetails> createState() => _SalonDetailsState();
}

class _SalonDetailsState extends State<SalonDetails> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<SalonServicesModel> salonServices =
        widget.salonModel.servicesList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        // systemOverlayStyle: SystemUiOverlayStyle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: const AssetImage('assets/shop_details/shop.png'),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.sizeOf(context).width,
                ),
                Positioned(
                  left: 16,
                  top: MediaQuery.paddingOf(context).top + 24,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: const Color(0x99F8FAFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromRGBO(255, 214, 0, 1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 80,
                  top: MediaQuery.paddingOf(context).top + 24,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: const Color(0x99F8FAFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: MediaQuery.paddingOf(context).top + 24,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: const Color(0x99F8FAFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.map,
                        color: Color.fromRGBO(255, 214, 0, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.salonModel.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.salonModel.address,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color.fromRGBO(255, 214, 0, 1),
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
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.local_offer,
                        color: Color.fromRGBO(255, 0, 25, 1),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '-58%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Nunito Sans',
                          color: Color.fromRGBO(255, 0, 25, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromRGBO(249, 134, 0, 1),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.salonModel.rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text(
                        '(2.7k)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                      const SizedBox(
                        width: 55,
                      ),
                      const Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(93, 100, 110, 1),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '10k views',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Text(
                            isExpanded
                                ? widget.salonModel.description
                                : '${widget.salonModel.description.substring(0, 30)}... Read more',
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Nunito Sans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Opening Hours',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 214, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
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
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 214, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
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
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
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
                          const SizedBox(width: 5),
                          _buildInterestContainer(
                            imagePath: "assets/categories/nails.png",
                            text: "Nails",
                          ),
                          const SizedBox(width: 5),
                          _buildInterestContainer(
                            imagePath: "assets/categories/facial.png",
                            text: "Facial",
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 7),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: salonServices.length,
                    itemBuilder: (context, index) {
                      return SalonServicesCard(
                        serviceName: salonServices[index].serviceName,
                        description: salonServices[index].description,
                        image: salonServices[index].image,
                        price: salonServices[index].price,
                        discount: salonServices[index].discount,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFFFD600)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View All Services',
                              style: TextStyle(
                                color: Color(0xFFFFD600),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 24),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Gallery',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 238),
                        Text(
                          'View all',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFFFD600),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Image.asset('assets/shop_details/gallery/gallery1.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery2.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery3.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery1.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery2.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery3.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery1.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery2.png'),
                      const SizedBox(width: 8),
                      Image.asset('assets/shop_details/gallery/gallery3.png'),
                      const SizedBox(width: 8),
                    ]),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Our Specialist',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 184),
                        Text(
                          'View all',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFFFD600),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                                'assets/shop_details/Specialist/rahul.png'),
                            const SizedBox(height: 6),
                            const Text(
                              'Rahul',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Image.asset(
                                'assets/shop_details/Specialist/merry.png'),
                            const SizedBox(height: 6),
                            const Text(
                              'Meery',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Image.asset(
                                'assets/shop_details/Specialist/bella.png'),
                            const SizedBox(height: 6),
                            const Text(
                              'Bella',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Image.asset(
                                'assets/shop_details/Specialist/joseph.png'),
                            const SizedBox(height: 6),
                            const Text(
                              'Joseph',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Image.asset(
                                'assets/shop_details/Specialist/samantha.png'),
                            const SizedBox(height: 6),
                            const Text(
                              'Samantha',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 234),
                        Text(
                          'View all',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFFFD600),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestContainer({
    required String imagePath,
    required String text,
  }) {
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
            style: const TextStyle(
              color: Color.fromRGBO(255, 214, 0, 1),
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

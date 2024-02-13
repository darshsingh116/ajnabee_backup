import 'package:ajnabee/models/salon_model.dart';
import 'package:ajnabee/models/salon_services_model.dart';
import 'package:ajnabee/screens/salon_services_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final double width = MediaQuery.sizeOf(context).width;
    final List<SalonServicesModel> salonServices =
        widget.salonModel.servicesList;
    bool isFavourite = false;
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
                  width: width,
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
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavourite = true;
                        });
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                      isSelected: isFavourite,
                      selectedIcon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        // fill: 1,
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
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
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
                    child: IconButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Color(0xFFFFD600)),
                        ),
                      ),
                      icon: const Padding(
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 8),
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
                  _buildReviewCard(
                    image: "imagePath",
                    name: "Jennie Whang",
                    time: DateTime(2024, 1, 12),
                    review:
                        "The place was clean, great serivce, stall are friendly. I will certainly recommend to my friends and visit again! ;)",
                    rating: 5,
                    width: width,
                  ),
                  _buildReviewCard(
                    image: "imagePath",
                    name: "Nathalie",
                    time: DateTime(2024, 2, 10),
                    review:
                        "Very nice service from the specialist. I always going here for my treatment.",
                    rating: 4,
                    width: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 4,
            bottom: 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        '(1 Service)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs 200',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rs 250',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          decoration: TextDecoration.lineThrough,
                          letterSpacing: 0.27,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              IconButton(
                constraints: const BoxConstraints(minWidth: 52, minHeight: 52),
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                  BorderSide(width: 1, color: Color(0xFFFFD600)),
                )),
                onPressed: () {},
                icon: SvgPicture.asset("assets/misc/Chat.svg", height: 24),
              ),
              const SizedBox(width: 16),
              IconButton(
                constraints: const BoxConstraints(minWidth: 132, minHeight: 52),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFFFD600),
                  ),
                ),
                onPressed: () {},
                icon: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required String image,
    required String name,
    required DateTime time,
    required String review,
    required int rating,
    required double width,
  }) {
    String getTimeDifferenceFromNow(DateTime dateTime) {
      Duration difference = DateTime.now().difference(dateTime);
      // Duration difference = Duration(days: 730);

      if (difference.inSeconds < 5) {
        return "Just now";
      } else if (difference.inMinutes < 1) {
        return "${difference.inSeconds} seconds ago";
      } else if (difference.inMinutes == 1) {
        return "1 minute ago";
      } else if (difference.inHours < 1) {
        return "${difference.inMinutes} minutes ago";
      } else if (difference.inHours == 1) {
        return "1 hour ago";
      } else if (difference.inHours < 24) {
        return "${difference.inHours} hours ago";
      } else if (difference.inDays == 1) {
        return "1 day ago";
      } else if (difference.inDays < 7) {
        return "${difference.inDays} days ago";
      } else if (difference.inDays < 14) {
        return "1 week ago";
      } else if (difference.inDays < 28) {
        return "${difference.inDays ~/ 7} weeks ago";
      } else if (difference.inDays < 61) {
        return "1 month ago";
      } else if (difference.inDays < 365) {
        return "${difference.inDays ~/ 30.41} months ago";
      } else if (difference.inDays ~/ 365 == 1) {
        return "1 year ago";
      } else {
        return "${difference.inDays ~/ 365.25} years ago";
      }
    }
    // log(getTimeDifferenceFromNow(time));

    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          CircleAvatar(
              backgroundImage:
                  //temp
                  const AssetImage(
                      "assets/shop_details/Specialist/samantha.png")),
          // NetworkImage(image)),

          const SizedBox(width: 16),
          SizedBox(
            width: width - 88,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: (width - 88) * 65 / 100),
                      child: Text(
                        name,
                        maxLines: 1,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.27,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: (width - 88) * 30 / 100),
                      child: Text(
                        getTimeDifferenceFromNow(time),
                        style: const TextStyle(
                          color: Color(0xFF5D636E),
                          fontSize: 11,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.36,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: List.generate(
                    rating,
                    (index) => SvgPicture.asset("assets/misc/Star.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  review,
                  softWrap: true,
                  // maxLines: 5,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),
          )
        ],
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

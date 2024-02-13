import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalonServicesCard extends StatefulWidget {
  final String serviceName;
  final String description;
  final String image;
  final double price;
  final int discount;
  bool? isSelected;

  SalonServicesCard({
    super.key,
    required this.serviceName,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    bool? isSelected,
  }) : isSelected = isSelected ?? false;

  @override
  State<SalonServicesCard> createState() => _SalonServicesCardState();
}

class _SalonServicesCardState extends State<SalonServicesCard> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width - 32;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        // clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.only(
          right: 16,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),

        child: Row(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                height: width / 4,
                width: width / 4,
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: width * 3 / 4 - 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: (width * 3 / 4) - 93),
                        child: Text(
                          widget.serviceName,
                          softWrap: true,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (widget.discount == 0) {
                            return SizedBox(width: 0);
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.sell,
                                    color: Color.fromARGB(255, 248, 0, 0),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '-${widget.discount}%',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 248, 0, 0),
                                      fontSize: 12,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rs ${widget.price}',
                    style: const TextStyle(
                      color: Color(0xFFFFD600),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: width * 3 / 4 - 64),
                        child: Text(
                          widget.description,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Color(0xFF50555C),
                            fontSize: 12,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.36,
                            overflow: TextOverflow.ellipsis,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Builder(builder: (context) {
                        if (widget.isSelected!) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isSelected = false;
                              });
                            },
                            icon: Container(
                              width: 32,
                              height: 32,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(
                                    eccentricity: 1,
                                    side: BorderSide(color: Colors.red)),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isSelected = true;
                              });
                            },
                            icon: Container(
                              width: 32,
                              height: 32,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFD600),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

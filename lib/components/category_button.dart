import 'package:flutter/material.dart';

typedef ButtonCallback = void Function();

class CategoryButton extends StatelessWidget {
  final String title;
  final String asset;
  final ButtonCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            fit: BoxFit.fill,
            height: 64,
            width: 64,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFFD600),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Circleavaterimage extends StatelessWidget {
  const Circleavaterimage({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/img_avatar.png'),
            fit: BoxFit.contain, // Adjust the fit property as needed
          ),
        ),
      ),
    );
  }
}

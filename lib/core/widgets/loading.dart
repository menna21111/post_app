import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../constant/size.dart';

class ShimmerLoading extends StatelessWidget {
   const ShimmerLoading({super.key,   this.height,required  this.width,required  this.borderraduis});
 final  double? height;
 final  double width;
final   double borderraduis;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[700]!,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        width:width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(width * borderraduis,),
        ),
      ),
    );
  }
}
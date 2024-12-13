import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/apptheme.dart';
import 'package:posts_app/core/widgets/applocalization.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/styles.dart';
import '../../domain/entites/post.dart';
import '../widget/circleavaterimage.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(Applocalization.of(context)!.translate('Details'),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: whitecolor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Circleavaterimage(
                        radius: 20.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                       Column(
                        children: [
                          Text(
                            'user${post.userid}',
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'now',
                              ))
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      icon: const Icon(Icons.more_vert),
                      color: primaryColor,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog();
                            });
                      }),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 30.w),
              child:  Text(
                post.title,
                style: Styles.textStyle18,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              
              child:  Text(
                post.body,
                style: Styles.textStyle14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

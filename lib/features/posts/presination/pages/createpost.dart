import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:posts_app/core/constant/colors.dart';
import 'package:posts_app/features/posts/presination/pages/homepage.dart';
import '../../../../core/widgets/applocalization.dart';
import '../../domain/entites/post.dart';
import '../bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import '../bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import '../widget/textfield.dart';

class Createpost extends StatelessWidget {
  const Createpost({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController postbody = TextEditingController();
    return Scaffold(
      appBar: _appbar(context),
      body: BlocListener<AdddeleteupdateBloc, AdddeleteupdateState>(
        listener: (context, state) {
          if (state is AdddeleteupdateLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.mes}'), )
            );
            Navigator.pop(context);
          }else if(state is AdddeleteupdateError){
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.mes}'), )
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Customtextfield(
                controller: title,
                hinttext: 'enter title',
                labeltext: '',
                iswntedborder: true,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  padding: EdgeInsets.symmetric(horizontal: 00.w),
                  height: 200.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Customtextfield(
                    controller: postbody,
                    hinttext: 'enter post',
                    labeltext: '',
                    iswntedborder: false,
                  )),
              SizedBox(
                height: 20.h,
              ),
              MaterialButton(
                  onPressed: () {
                    context.read<AdddeleteupdateBloc>().add(Addpost(
                        post: Post(
                            title: title.text,
                            body: postbody.text,
                            id: 1,
                            userid: 2)));
                  },
                  color: primaryColor,
                  minWidth: 150.w,
                  height: 35.h,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    'create post',
                    style: TextStyle(
                      color: whitecolor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _appbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: whitecolor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title:  Text(Applocalization.of(context)!.translate('create')),
    );
  }
}

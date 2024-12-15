import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:posts_app/core/constant/colors.dart';
import 'package:posts_app/features/posts/presination/pages/homepage.dart';
import '../../../../core/widgets/applocalization.dart';
import '../../domain/entites/post.dart';
import '../bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import '../bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import '../widget/scaffoldmessanger.dart';
import '../widget/textfield.dart';

class Createpost extends StatelessWidget {
  const Createpost({super.key, required this.isupdated, this.post});
  final bool isupdated;
  final Post? post;

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController postbody = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: _appbar(context),
      body: BlocConsumer<AdddeleteupdateBloc, AdddeleteupdateState>(
          listener: (context, state) {
        if (state is AdddeleteupdateLoaded) {
          showsnackbar(state.mes, context, primaryColor);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(),
              ),
              (_) => false);
        } else if (state is AdddeleteupdateError) {
          showsnackbar(state.mes, context, primaryColor);
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Customtextfield(
                  func: (value) {
                    if (value!.isEmpty) {
                      return 'enter post';
                    }
                    return null;
                  },
                  minLines: 1,
                  controller: title,
                  hinttext: isupdated ? post!.title : 'enter title',
                  labeltext: '',
                  iswntedborder: true,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Customtextfield(
                  minLines: 5,
                  func: (value) {
                    if (value!.isEmpty) {
                      return 'enter post';
                    }
                    return null;
                  },
                  controller: postbody,
                  hinttext: isupdated ? post!.body : 'enter post',
                  labeltext: '',
                  iswntedborder: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MaterialButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (isupdated) {
                          context.read<AdddeleteupdateBloc>().add(Updatepost(
                              post: Post(
                                  title: title.text,
                                  body: postbody.text,
                                  id: post!.id,
                                  userid: post!.userid)));
                        } else {
                          context.read<AdddeleteupdateBloc>().add(Addpost(
                              post: Post(
                                  title: title.text,
                                  body: postbody.text,
                                  id: null,
                                  userid: null)));
                        }
                      }
                    },
                    color: primaryColor,
                    minWidth: 150.w,
                    height: 35.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: state is AdddeleteupdateLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: whitecolor,
                          ))
                        : Text(
                            isupdated ? 'update post' : 'create post',
                            style: TextStyle(
                              color: whitecolor,
                            ),
                          ))
              ],
            ),
          ),
        );
      }),
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
      title: Text(isupdated
          ? Applocalization.of(context)!.translate('edit')
          : Applocalization.of(context)!.translate('create')),
    );
  }
}

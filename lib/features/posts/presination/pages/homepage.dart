import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/apptheme.dart';

import '../../../../core/constant/styles.dart';
import '../../../../core/widgets/applocalization.dart';
import '../../../../core/widgets/loading.dart';
import '../bloc/getposts/getposts_bloc.dart';
import '../widget/circleavaterimage.dart';
import 'createpost.dart';
import 'detailspage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: BlocBuilder<GetpostsBloc, GetpostsState>(
        builder: (context, state) {
          if (state is GetpostsLoaded) {
            return RefreshIndicator(
              onRefresh: ()async {
                context.read<GetpostsBloc>().add(GetpostsRefresh());
              },
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return  Detailspage(post: state.post[index],);
                        }));
                      },
                      leading: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Circleavaterimage(radius: 20.r),
                      ),
                      subtitle: Text(
                        state.post[index].body,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      title: Text(
                        state.post[index].title,
                        style: Styles.textStyle18.copyWith(color: Colors.black),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: .5,
                    );
                  },
                  itemCount: state.post.length),
            );
          } else if (state is GetpostsError) {
            return Center(child: Text(state.mes));
          } else {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context,indexx) {
                return ShimmerLoading(borderraduis: 0,height: 120.h,width: 300.w,);
              }
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Createpost(isupdated: false,);
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _appbar(BuildContext context) {
    return AppBar(
      title:  Text(Applocalization.of(context)!.translate('posts'), style: Styles.textStyle30),
    );
  }
}

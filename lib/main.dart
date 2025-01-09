import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/debendcyinject.dart' as di;
import 'package:posts_app/features/posts/presination/pages/homepage.dart';
import 'package:provider/provider.dart';

import 'core/apptheme.dart';
import 'core/widgets/applocalization.dart';
import 'features/posts/presination/bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import 'features/posts/presination/bloc/getposts/getposts_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initdi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return di.sl<AdddeleteupdateBloc>();
          },
        ),
        BlocProvider(
          create: (_) {
            return di.sl<GetpostsBloc>()..add(Getposts());
          },
        ),
      ],
      child: ScreenUtilInit(
          designSize: Size(350, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              localizationsDelegates: [
                //responsible for diminsion of app
                Applocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviclocale, supportedLocales) {
              if (deviclocale != null) {
                  for (var locale in supportedLocales) {
                  
                    if (locale.languageCode == deviclocale.languageCode) {
                      return locale;
                    }
                 
                  }   return supportedLocales
                        .first; // لو اللغه اللي بيدعمها الموبايل ما بيدعمهاش اللاب رجعالانجليزيه
                  //   if(deviclocale != null){app late to know the language of device
                }
              },
              theme: appTheme,
              debugShowCheckedModeBanner: false,
              home: const Homepage(),
            );
          }),
    );
  }
}

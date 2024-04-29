import 'package:chat_app/bloc/login_bloc/login_bloc.dart';
import 'package:chat_app/bloc/message_bloc/message_bloc.dart';
import 'package:chat_app/bloc/message_bloc/message_event.dart';
import 'package:chat_app/firebase_options.dart';

// import 'package:chat_app/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/login_bloc/login_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      builder: (
        context,
        child,
      ) {
        ScreenUtil.init(
          context,
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => UserBloc()..add(CallUserEvent()),
            ),
            BlocProvider(
              create: (_) => MessageBloc()..add(CallMessageEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}

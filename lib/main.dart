import 'package:chatgpt/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/api_key.dart';
import 'domain/models/messages_list_model/messages_list_model.dart';
import 'presentation/blocs/messages_bloc/messages_bloc.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("themeBox");
  await Hive.openBox("chatsBox");
  await Hive.openBox("apiBox");
  APIConfig.setAPIonInit();
  Hive.registerAdapter(MessagesListModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessagesBloc()..add(LoadMessages()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(LoadTheme()),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLoadedState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              home: HomeScreen(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: HomeScreen(),
            );
          }
        },
      ),
    );
  }
}

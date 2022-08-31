import 'package:flutter/material.dart';
import 'package:flutter_app2/bloc/home/home_bloc.dart';
import 'package:flutter_app2/pages/my_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/BlocObserver.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    //log onTransition event
    blocObserver: SimpleBlocObserver(),
  );
}

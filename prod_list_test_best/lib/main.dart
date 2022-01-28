import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_list_test/app.dart';
import 'package:prod_list_test/simple_block_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}

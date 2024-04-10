import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/app/my_app.dart';
import 'package:janadem/screens/user/add_problem/camera_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('accountData');

  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(
    MaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: const ProviderScope(child: MyApp())
        );
      },
    )
  );
}
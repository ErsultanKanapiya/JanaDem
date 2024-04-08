import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:janadem/screens/bottom_nav_bar.dart';
import 'package:janadem/screens/user/add_problem/add_problem_screen.dart';

class CameraViewPage extends ConsumerWidget {
  final String path;
  const CameraViewPage({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.black38,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ref.watch(photoPathProvider.notifier).state = path;
                          Get.offAll(
                              () => const UserBottomNavBar()
                          );
                        },
                        child: const CircleAvatar(
                          radius: 27,
                          backgroundColor: Color(0xff056C5F),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

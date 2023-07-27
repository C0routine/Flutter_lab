import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/app/app_color.dart';
import 'package:flutterlab/app/app_router.dart';
import 'package:flutterlab/app/app_style.dart';

class FlutterRoute extends StatelessWidget {
  const FlutterRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppRouter> flutterList = [
      // valueNotifier, ValueListenableBuilder
      AppRouter.valueNotifier,
      // ChangeNotifier, ListenableBuilder
      AppRouter.changeNotifier,
      // StatefulWidget Lifecycle
      AppRouter.statefulWidget,
      // LayoutBuilder
      AppRouter.layoutBuilder,
      // skeleton Widget Animation
      AppRouter.skeletonAnimation,
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: flutterList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: AppStyle.gapBaseAll,
            child: InkWell(
              borderRadius: AppStyle.baseBorder,
              onTap: () => context.push(flutterList[index].path),
              child: Ink(
                padding: AppStyle.gapBaseAll,
                decoration: const BoxDecoration(
                  color: AppColor.lightSubBackground,
                  borderRadius: AppStyle.baseBorder,
                ),
                child: Center(
                  child: Text(flutterList[index].name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

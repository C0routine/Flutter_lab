import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/app/app_color.dart';
import 'package:flutterlab/app/app_router.dart';
import 'package:flutterlab/app/app_style.dart';

class DartRoute extends StatelessWidget {
  const DartRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppRouter> dartList = [
      // Singletons pattern
      AppRouter.singletons,
      // Class keywords
      AppRouter.keywords,
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: dartList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: AppStyle.gapBaseAll,
            child: InkWell(
              borderRadius: AppStyle.baseBorder,
              onTap: () => context.push(dartList[index].path),
              child: Ink(
                padding: AppStyle.gapBaseAll,
                decoration: const BoxDecoration(
                  color: AppColor.lightSubBackground,
                  borderRadius: AppStyle.baseBorder,
                ),
                child: Center(
                  child: Text(dartList[index].name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

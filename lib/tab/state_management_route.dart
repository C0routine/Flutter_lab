import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/app/app_color.dart';
import 'package:flutterlab/app/app_router.dart';
import 'package:flutterlab/app/app_style.dart';

class StateManagement extends StatelessWidget {
  const StateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppRouter> stateList = [
      AppRouter.bloc,
      AppRouter.getX,
      AppRouter.provider,
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: stateList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200,
            margin: AppStyle.gapBaseAll,
            child: Ink(
              decoration: const BoxDecoration(
                color: AppColor.lightSubBackground,
                borderRadius: AppStyle.baseBorder,
              ),
              child: InkWell(
                borderRadius: AppStyle.baseBorder,
                onTap: () => context.push(stateList[index].path),
                child: Center(
                  child: Text(
                    stateList[index].name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

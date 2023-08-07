import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_widget.dart';

class LabFirebaseRemoteConfig extends StatefulWidget {
  const LabFirebaseRemoteConfig({super.key});

  @override
  State<LabFirebaseRemoteConfig> createState() => _LabFirebaseRemoteConfigState();
}

class _LabFirebaseRemoteConfigState extends State<LabFirebaseRemoteConfig> {
  String stateAppVersion = '1.0.0';

  Future<void> getRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 1),
      ),
    );
    await remoteConfig.fetchAndActivate();

    var latestAppVersion = remoteConfig.getAll()['latest_app_version'];
    var appVersion = jsonDecode(
      latestAppVersion?.asString() ?? '{"app_version" : "2.0.0", "latest" : "false"}',
    );
    print('AppVersion : ${appVersion['app_version']}');
    print('AppVersion : ${appVersion['latest']}');

    if (appVersion['app_version'] != stateAppVersion) {
      setState(() {
        stateAppVersion = appVersion['app_version'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExecuteTextButton(executeText: 'RemoteConfig Test', onPress: getRemoteConfig),
              Text('AppVersion : $stateAppVersion'),
            ],
          ),
        ),
      ),
    );
  }
}

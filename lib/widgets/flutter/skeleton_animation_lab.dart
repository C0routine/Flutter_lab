import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_widget.dart';

/// Skeleton Shimmer Animation
class LabSkeletonAnimation extends StatefulWidget {
  const LabSkeletonAnimation({super.key});

  @override
  State<LabSkeletonAnimation> createState() => _LabSkeletonAnimationState();
}

class _LabSkeletonAnimationState extends State<LabSkeletonAnimation> {
  // Change Loading
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300] as Color,
                      highlightColor: Colors.grey[400]!.withOpacity(0.8),
                      child: Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    )
                  : Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
              ExecuteTextButton(
                executeText: isLoading ? 'OnPress Loading Complete' : 'OnPress Loading...',
                onPress: () => setState(() => isLoading = !isLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

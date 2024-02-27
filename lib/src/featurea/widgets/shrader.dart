// Define the ShimmerLoading stateful widget that wraps a given child widget
import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and the animation
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.linear,
    ));

    // Start the animation
    _shimmerController.repeat();
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.grey[300]!,
      Colors.grey[100]!,
      Colors.grey[300]!,
    ];

    final stops = [0.0, 0.5, 1.0];
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          // Use srcATop blend mode to replace any color that your child widget painted with the shader color
          blendMode: BlendMode.srcATop,
          // Apply the shimmer gradient as a shader
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: colors,
              stops: stops,
              begin: Alignment(_shimmerAnimation.value, 0),
              end: const Alignment(-1, 0),
            ).createShader(bounds);
          },
          // The child widget to apply the shimmer effect
          child: child,
        );
      },
      // The child widget to apply the shimmer effect
      child: widget.child,
    );
  }
}

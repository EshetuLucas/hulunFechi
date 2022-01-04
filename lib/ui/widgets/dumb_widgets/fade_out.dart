import 'package:flutter/material.dart';

class FadeOut extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final bool isAuto;
  final Duration duration;

  const FadeOut({
    Key? key,
    required this.child,
    this.isVisible = true,
    this.isAuto = false,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _FadeOutState createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.isAuto) {
      Future.delayed(Duration(milliseconds: 300), () {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      opacity: widget.isVisible || _isVisible ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';

import 'card_selector.dart';

@immutable
class CardInfoLayout extends StatefulWidget {
  final Widget card;
  final Widget infoCard;
  final Widget detailsCard;
  final EdgeInsets padding;

  final bool infoCardVisible;

  const CardInfoLayout({
    super.key,
    required this.padding,
    required this.card,
    required this.infoCard,
    required this.detailsCard,
    required this.infoCardVisible,
  });

  @override
  State<CardInfoLayout> createState() => _CardInfoLayoutState();
}

class _CardInfoLayoutState extends State<CardInfoLayout>
    with SingleTickerProviderStateMixin {
  TweenSequence<double>? _cardOpacityTween;
  TweenSequence<double>? _scaleTween;
  Tween<Offset>? _slideDownTween;
  Tween<double>? _infoOpacityTween;
  Tween<double>? _backgroundSlideUpTween;
  Tween<double>? _detailOpacityTween;
  Tween<Offset>? _detailsSlideUpTween;

  late AnimationController _animation;

  @override
  void initState() {
    super.initState();

    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _cardOpacityTween = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.8), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.8, end: 1), weight: 4),
    ]);
    _scaleTween = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.9), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.9, end: 1.1), weight: 1),
    ]);
    _slideDownTween =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 20));
    _infoOpacityTween = Tween<double>(begin: 1, end: 0);
    _backgroundSlideUpTween =
        Tween<double>(begin: 260 + widget.padding.top, end: 0);

    _detailOpacityTween = Tween<double>(begin: 0, end: 1);
    _detailsSlideUpTween =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero);

    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant CardInfoLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.infoCardVisible) {
      _animation.forward();
    } else {
      _animation.reverse();
    }

    if (widget.padding.top != oldWidget.padding.top) {
      _backgroundSlideUpTween = Tween<double>(
        begin: 260 + widget.padding.top,
        end: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = widget.padding.top;
    return Stack(
      children: [
        Positioned(
          top: 25 + paddingTop,
          left: 0,
          right: 0,
          child: const CardSelector(),
        ),
        Positioned(
          top: _backgroundSlideUpTween!
              .chain(CurveTween(curve: Curves.easeInOut))
              .evaluate(_animation),
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
            ),
          ),
        ),
        Positioned(
          top: 50 + paddingTop,
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: _cardOpacityTween!
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .evaluate(_animation),
              child: Transform.scale(
                scale: _scaleTween!
                    .chain(CurveTween(curve: Curves.easeInOut))
                    .evaluate(_animation),
                child: widget.card,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 300.0,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Opacity(
              opacity: _detailOpacityTween!
                  .chain(CurveTween(curve: const Interval(0.5, 1)))
                  .evaluate(_animation),
              child: Transform.translate(
                offset: _detailsSlideUpTween!
                        .chain(CurveTween(curve: const Interval(0.5, 1)))
                        .evaluate(_animation) +
                    Offset(0, paddingTop),
                child: widget.detailsCard,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: _infoOpacityTween!
                .chain(CurveTween(curve: const Interval(0, 0.5)))
                .evaluate(_animation),
            child: Transform.translate(
              offset: _slideDownTween!
                      .chain(CurveTween(curve: const Interval(0, 0.5)))
                      .evaluate(_animation) +
                  Offset(0, paddingTop),
              child: widget.infoCard,
            ),
          ),
        )
      ],
    );
  }
}

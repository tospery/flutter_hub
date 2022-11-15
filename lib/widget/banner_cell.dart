import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_hub/model/banner.dart';
import 'package:hi_flutter/hi_flutter.dart';

class BannerCell extends HiCell<Banner> {
  const BannerCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: AspectRatio(
          aspectRatio: 1200.0 / 532.0,
          child: Swiper(
            indicatorAlignment: AlignmentDirectional.bottomCenter,
            controller: SwiperController(initialPage: 0),
            indicator: CircleSwiperIndicator(),
            children: model.cards
                ?.map((e) => Image.asset(e.icon ?? '', fit: BoxFit.fill))
                .toList(),
          ),
        ),
      ),
    );
  }
}

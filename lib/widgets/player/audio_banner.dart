import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AudioBannerWidget extends StatelessWidget {
  const AudioBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width - 50,
              width: MediaQuery.of(context).size.width - 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://picsum.photos/200/200',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}

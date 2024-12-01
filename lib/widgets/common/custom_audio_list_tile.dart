import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_constants.dart';

class CustomAudioListTile extends StatelessWidget {
  const CustomAudioListTile({
    super.key,
    this.isFavorite = false,
    this.isFavoriteScreen = false,
  });

  final bool isFavorite;
  final bool isFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    kTestImage,
                  ),
                ),
              ),
            ),
            title: const Text(
              'Song that displays',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text('Artist'),
            trailing: isFavoriteScreen
                ? Text('3:00',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.grey, fontSize: 15))
                : isFavorite
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            size: 17,
                          ),
                          Text('3:00',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      )
                    : null,
          );
        });
  }
}

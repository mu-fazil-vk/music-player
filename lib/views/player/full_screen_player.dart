import 'package:flutter/material.dart';
import 'package:music_player/widgets/common/custom_audio_list_tile.dart';
import 'package:music_player/widgets/player/advanced_player_controllers.dart';
import 'package:music_player/widgets/player/audio_banner.dart';
import 'package:music_player/widgets/player/basic_audio_controllers.dart';
import 'package:music_player/widgets/player/custom_slider.dart';
import 'package:music_player/widgets/player/more_options_bottom_sheet.dart';

class FullScreenMusicPlayer extends StatefulWidget {
  const FullScreenMusicPlayer({super.key});

  @override
  State<FullScreenMusicPlayer> createState() => _FullScreenMusicPlayerState();
}

class _FullScreenMusicPlayerState extends State<FullScreenMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Show bottom sheet with more options
              showModalBottomSheet(
                context: context,
                builder: (context) => buildMoreOptionsSheet(context),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Album Art
            const Hero(
                key: ValueKey('image'),
                tag: 'image',
                child: AudioBannerWidget()),
            // Song Info
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Song Title',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Artist Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Progress Bar
            const CustomSlider(),
            // Classic Control Buttons
            //ClassicControlButtons(),

            const BasicAudioControllersWidget(),

            const SizedBox(height: 40),

            // More controls
            const AdvancedPlayerControllersWidget(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onVerticalDragEnd: (details) => showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) => _buildQueueSheet(),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Icon(
                  Icons.expand_less,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQueueSheet() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const CustomAudioListTile());
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/services/data_manager.dart';

List userCustomPlaylists =
    Hive.box('user').get('customPlaylists', defaultValue: []);
List userLikedSongsList = Hive.box('user').get('likedSongs', defaultValue: []);
List userRecentlyPlayed =
    Hive.box('user').get('recentlyPlayedSongs', defaultValue: []);

    final currentLikedSongsLength = ValueNotifier<int>(userLikedSongsList.length);
final currentRecentlyPlayedLength = ValueNotifier<int>(userRecentlyPlayed.length);
final currentCustomPlaylistsLength = ValueNotifier<int>(userCustomPlaylists.length);

int activeSongId = 0;

Future<List> getSongsList(String searchQuery) async {
  try {
    // Fetch songs from Storage.
    return [];
  } catch (e, stackTrace) {
    log('Error in fetchSongsList \n$e\n\n$stackTrace');
    return [];
  }
}

Future<List> getAllSongs() async {
  try {
    // Fetch all songs from Storage.
    return [];
  } catch (e, stackTrace) {
    log('Error in fetchAllSongs \n$e\n\n$stackTrace');
    return [];
  }
}

Future<List> getAlbumsList(String searchQuery) async {
  try {
    // Fetch albums from Storage.
    return [];
  } catch (e, stackTrace) {
    log('Error in fetchAlbumsList \n$e\n\n$stackTrace');
    return [];
  }
}

Future<List> getUserPlaylists() async {
  try {
    // Fetch user playlists from Storage.
    return [];
  } catch (e, stackTrace) {
    log('Error in fetchUserPlaylists \n$e\n\n$stackTrace');
    return [];
  }
}

String createCustomPlaylist(
  String playlistName,
  String? image,
  BuildContext context,
) {
  final customPlaylist = {
    'title': playlistName,
    'source': 'user-created',
    if (image != null) 'image': image,
    'list': [],
  };
  userCustomPlaylists.add(customPlaylist);
  //addOrUpdateData('user', 'customPlaylists', userCustomPlaylists);
  //return '${context.l10n!.addedSuccess}!';
  return 'Added Successfully!';
}

String addSongInCustomPlaylist(
  String playlistName,
  Map song, {
  int? indexToInsert,
}) {
  final customPlaylist = userCustomPlaylists.firstWhere(
    (playlist) => playlist['title'] == playlistName,
    orElse: () => null,
  );

  if (customPlaylist != null) {
    final List<dynamic> playlistSongs = customPlaylist['list'];
    indexToInsert != null
        ? playlistSongs.insert(indexToInsert, song)
        : playlistSongs.add(song);
    //addOrUpdateData('user', 'customPlaylists', userCustomPlaylists);
    return 'Song added to custom playlist: $playlistName';
  } else {
    return 'Custom playlist not found: $playlistName';
  }
}

void removeSongFromPlaylist(
  Map playlist,
  Map songToRemove, {
  int? removeOneAtIndex,
}) {
  if (playlist['list'] == null) return;
  final playlistSongs = List<dynamic>.from(playlist['list']);
  removeOneAtIndex != null
      ? playlistSongs.removeAt(removeOneAtIndex)
      : playlistSongs
          .removeWhere((song) => song['ytid'] == songToRemove['ytid']);
  playlist['list'] = playlistSongs;
  // if (playlist['source'] == 'user-created')
  //   addOrUpdateData('user', 'customPlaylists', userCustomPlaylists);
  // else
  //   addOrUpdateData('user', 'playlists', userPlaylists);
}

void removeUserCustomPlaylist(dynamic playlist) {
  userCustomPlaylists.remove(playlist);
  //addOrUpdateData('user', 'customPlaylists', userCustomPlaylists);
}

Future<void> updateSongLikeStatus(dynamic songId, bool add) async {
  // if (add) {
  //   userLikedSongsList
  //       .add(await getSongDetails(userLikedSongsList.length, songId));
  // } else {
  //   userLikedSongsList.removeWhere((song) => song['ytid'] == songId);
  // }
  // addOrUpdateData('user', 'likedSongs', userLikedSongsList);
}

void moveLikedSong(int oldIndex, int newIndex) {
  final _song = userLikedSongsList[oldIndex];
  userLikedSongsList
    ..removeAt(oldIndex)
    ..insert(newIndex, _song);
  currentLikedSongsLength.value = userLikedSongsList.length;
  //addOrUpdateData('user', 'likedSongs', userLikedSongsList);
}

const recentlyPlayedSongsLimit = 50;

bool isSongAlreadyLiked(songIdToCheck) =>
    userLikedSongsList.any((song) => song['ytid'] == songIdToCheck);

Future<void> updateRecentlyPlayed(dynamic songId) async {
  if (userRecentlyPlayed.length == 1 && userRecentlyPlayed[0]['ytid'] == songId)
    return;
  if (userRecentlyPlayed.length >= recentlyPlayedSongsLimit) {
    userRecentlyPlayed.removeLast();
  }

  userRecentlyPlayed.removeWhere((song) => song['ytid'] == songId);
  currentRecentlyPlayedLength.value = userRecentlyPlayed.length;

  // final newSongDetails =
  //     await getSongDetails(userRecentlyPlayed.length, songId);

  // userRecentlyPlayed.insert(0, newSongDetails);
   currentRecentlyPlayedLength.value = userRecentlyPlayed.length;
   addOrUpdateData('user', 'recentlyPlayedSongs', userRecentlyPlayed);
}
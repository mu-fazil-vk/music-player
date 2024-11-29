import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200/200',
                      ),
                    ),
                  ),
                ),
                title: const Text(
                  'Song that displays',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text('Artist'),
                trailing: Text('3:00',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.grey, fontSize: 15)),
              );
            }),
      ),
    );
  }
}

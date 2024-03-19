import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
String imageUrl =
    "https://purepng.com/public/uploads/large/purepng.com-booksbookillustratedwrittenprintedliteratureclipart-1421526451707uyace.png";

class LibraryScreens extends StatefulWidget {
  const LibraryScreens({super.key});

  @override
  State<LibraryScreens> createState() => _LibraryScreensState();
}

class _LibraryScreensState extends State<LibraryScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/extensions.dart';

class GalleryDetailPage extends StatefulWidget {
  static const path = "/gallery-detail";

  const GalleryDetailPage({super.key, required this.images});

  final List<String> images;

  @override
  State<GalleryDetailPage> createState() => _GalleryDetailPageState();
}

class _GalleryDetailPageState extends State<GalleryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.route.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Detail Galeri'),
      ),
      body: PageView(
        allowImplicitScrolling: true,
        padEnds: true,
        pageSnapping: true,
        children: widget.images
            .map(
              (e) => InteractiveViewer(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(e),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

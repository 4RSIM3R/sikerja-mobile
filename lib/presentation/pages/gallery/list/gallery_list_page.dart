import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/presentation/pages/gallery/detail/gallery_detail_page.dart';

class GalleryListPage extends StatefulWidget {
  static const path = "/gallery-list";

  const GalleryListPage({super.key});

  @override
  State<GalleryListPage> createState() => _GalleryListPageState();
}

class _GalleryListPageState extends State<GalleryListPage> {
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
        title: const Text('Galeri'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        children: List.generate(
          10,
          (index) {
            return InkWell(
              onTap: () {
                context.route.push(GalleryDetailPage.path, extra: {
                  'images': List.generate(10, (index) => 'https://picsum.photos/${200 + index}'),
                });
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider('https://picsum.photos/${200 + index}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

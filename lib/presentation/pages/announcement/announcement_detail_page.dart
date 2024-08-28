import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:next_starter/data/models/announcement/announcement_model.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class AnnouncementDetailPage extends StatefulWidget {
  const AnnouncementDetailPage({
    super.key,
    required this.model,
  });

  final Announcement model;

  static const path = "/announcement-detail";

  @override
  State<AnnouncementDetailPage> createState() => _AnnouncementDetailPageState();
}

class _AnnouncementDetailPageState extends State<AnnouncementDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Berita'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: CachedNetworkImageProvider('https://terasjabar.co/wp-content/uploads/2020/03/IMG-20200315-WA0001.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.model.title ?? '-', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            HtmlWidget(
              widget.model.content ?? '-',
            )
          ],
        ),
      ),
    );
  }
}

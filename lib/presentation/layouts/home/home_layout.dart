import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:next_starter/common/constant/ui_constant.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi! Pengguna', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  Text('Silahkan Melakukan Absensi', style: CustomTextTheme.paragraph1),
                ],
              ),
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Text(DateFormat('HH:mm:ss').format(DateTime.now()), style: CustomTextTheme.paragraph1);
                },
              ),
            ],
          ),
          16.verticalSpace,
          CarouselSlider(
            options: CarouselOptions(
              height: 160,
              enlargeCenterPage: true,
            ),
            items: banners.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: ColorTheme.primary,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(i),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ColorTheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.clock, color: ColorTheme.primary),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Absensi',
                    style: CustomTextTheme.paragraph1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ColorTheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.mail, color: ColorTheme.primary),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Disposisi',
                    style: CustomTextTheme.paragraph1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ColorTheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.doc_checkmark, color: ColorTheme.primary),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Dokumen',
                    style: CustomTextTheme.paragraph1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ColorTheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.pencil_outline, color: ColorTheme.primary),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Kegiatan',
                    style: CustomTextTheme.paragraph1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kegiatan', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
              Text(
                'Lihat Semua',
                style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
              )
            ],
          ),
          16.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: ColorTheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(CupertinoIcons.doc_checkmark, color: ColorTheme.primary),
                ),
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dikeluarkan Oleh Kepala Dinas ABCD', style: CustomTextTheme.paragraph1),
                  4.verticalSpace,
                  Text(
                    'Pelatihan Kepemimpinan Nasional (PKN) Tingkat II Angkatan I Tahun 2023 : Evaluasi Implementasi Proyek Perubahan',
                    style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    softWrap: true,
                  ),
                  4.verticalSpace,
                  Text('29 Agustus 2025', style: CustomTextTheme.paragraph1)
                ],
              ).expand()
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Berita', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
              Text(
                'Lihat Semua',
                style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
              )
            ],
          ),
          16.verticalSpace,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 175,
                decoration: BoxDecoration(
                  color: ColorTheme.primary,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(banners[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Container(
                width: double.infinity,
                height: 175,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black45, Colors.transparent],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Judul Berita',
                      style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    4.verticalSpace,
                    Text(
                      '28 Agustus 2024',
                      style: CustomTextTheme.paragraph1.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ).p16().scrollVertical(),
    );
  }
}

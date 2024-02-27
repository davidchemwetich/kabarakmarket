// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kabarakmarket/src/domain/ad_helper.dart';
import 'package:kabarakmarket/src/featurea/auth/view/log_bar.dart';
import 'package:kabarakmarket/src/featurea/views/profile/procards_screen.dart';
import 'package:kabarakmarket/src/featurea/views/profile/profile_screen.dart';
import 'package:kabarakmarket/src/featured/constants/appartment_colors.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer> {
  late BannerAd bottomBannerAd;
  bool isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  Future loadBannerAd() async {
    bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print("Failed To Load : ${error.message}");
          ad.dispose();
        }),
        //
        request: const AdRequest());
    bottomBannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Logbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Column(
          children: [
            SizedBox(
              child: ProfileCard(
                imageUrl: 'https://loremflickr.com/640/360',
                email: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: ProfileCards(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isBannerAdLoaded
          ? SizedBox(
              width: bottomBannerAd.size.width.toDouble(),
              height: bottomBannerAd.size.height.toDouble(),
              child: AdWidget(ad: bottomBannerAd),
            )
          : const LinearProgressIndicator(),
    );
  }
}

          // Create an instance of MyAdBanner and pass in the adUnitId and placeholder widgets
     
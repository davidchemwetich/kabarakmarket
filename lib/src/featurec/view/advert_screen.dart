import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddSell extends StatefulWidget {
  const AddSell({Key? key}) : super(key: key);

  @override
  State<AddSell> createState() => _AddSellState();
}

class _AddSellState extends State<AddSell> {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<String>> getMyAds() async {
    final List<FileObject> result = await supabase.storage
        .from('public/adverts')
        .list(path: supabase.auth.currentUser!.id);

    List<String> myImages = [];

    for (var image in result) {
      final getUrl =
          supabase.storage.from('public/adverts').getPublicUrl(image.name);
      myImages.add(getUrl);
    }

    return myImages;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMyAds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.isNotEmpty &&
            snapshot.data![0].startsWith('https')) {
          return CarouselSlider(
            items: snapshot.data!
                .map((url) => CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {});
              },
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}

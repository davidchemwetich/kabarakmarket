import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/auth/providers/auth_user.dart';
import 'package:kabarakmarket/src/featurea/auth/view/log_bar.dart';
import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:kabarakmarket/src/utils/utils.dart';
import 'package:kabarakmarket/src/featurea/widgets/likes_counter.dart';
import 'package:kabarakmarket/src/featurea/widgets/memory_item_form.dart';

class ProductView extends ConsumerWidget {
  final Memory data;
  const ProductView({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      appBar: const Logbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: ref.read(imageUrlProvider(
                      userId: data.profileId, filename: data.imageId)),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (user != null && user.id == data.profileId)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          context.showBottomSheet(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: MemoryItemForm(data: data),
                            ),
                          );
                        },
                        child: const Chip(
                          label: Text("Edit"),
                          avatar: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          ' ${data.username}',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.verified,
                        color: Colors.pink,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Chip(
                        avatar: Icon(Icons.contact_support),
                        label: Text('Chat Seller'),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      const Chip(
                        avatar: Icon(Icons.warning_rounded),
                        label: Text('Report Ads'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: LikesCounter(data: data),
                      ),
                      const SizedBox(width: 30.0),
                      SizedBox.square(
                        child: Text(
                          'Ksh ${data.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date Posted',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              // DateFormat('MMMM dd, yyyy')
                              // .format(data.createdAt),
                              '6 days',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey[600]),
                          const SizedBox(width: 8.0),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        // data.location,
                        'Kabarak',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

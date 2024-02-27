import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/auth/providers/auth_user.dart';
import 'package:kabarakmarket/src/featurea/widgets/memory_item_form.dart';
import 'package:kabarakmarket/src/featurea/widgets/shrader.dart';
import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:kabarakmarket/src/featured/constants/appartment_colors.dart';
import 'package:kabarakmarket/src/utils/utils.dart';

class MemoryItemView extends ConsumerWidget {
  const MemoryItemView({
    required this.data,
    Key? key,
  }) : super(key: key);

  final Memory data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: ref.read(
                  imageUrlProvider(
                    userId: data.profileId,
                    filename: data.imageId,
                  ),
                ),
                fit: BoxFit.fill,
                placeholder: (context, url) => const ShimmerLoading(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(
                child: Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        if (user != null && user.id == data.profileId)
                          Positioned.fill(
                            child: InputChip(
                              onPressed: () {
                                context.showBottomSheet(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: MemoryItemForm(data: data),
                                  ),
                                );
                              },
                              backgroundColor: Colors.blue,
                              label: const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              avatar: const Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientBackground,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            height: 80,
            width: 300,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: data.title
                            .split(' ')
                            .take(5)
                            .join(' '), // Limit to 5 words
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (data.title.split(' ').length > 8)
                        const TextSpan(text: '...'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'ksh${data.price}',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

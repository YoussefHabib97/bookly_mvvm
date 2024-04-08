import 'package:flutter/material.dart';

class BookCoverTile extends StatelessWidget {
  final void Function()? onTap;
  final bool isDecorationImg;
  const BookCoverTile({
    super.key,
    this.onTap,
    required this.isDecorationImg,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: isDecorationImg
          ? Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://i.imgur.com/j88cDqw.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(16),
                // highlightColor: Colors.green,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://i.imgur.com/j88cDqw.png',
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}

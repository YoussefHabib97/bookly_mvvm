import 'package:flutter/material.dart';

class BookCoverTile extends StatelessWidget {
  final void Function()? onTap;
  final bool isDecorationImg;
  final bool isRender;

  const BookCoverTile({
    super.key,
    this.onTap,
    required this.isDecorationImg,
    this.isRender = true,
  });

  factory BookCoverTile.noSuggestion() {
    return const BookCoverTile(
      isDecorationImg: false,
      isRender: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isRender
        ? AspectRatio(
            aspectRatio: 2.5 / 4,
            child: isDecorationImg
                ? Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://placehold.co/600x400.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://placehold.co/600x400.png',
                      fit: BoxFit.cover,
                    ),
                  ),
          )
        : const SizedBox();
  }
}

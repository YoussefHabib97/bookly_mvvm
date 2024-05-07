import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookCoverTile extends StatelessWidget {
  final void Function()? onTap;
  final bool isDecorationImg;
  final bool isRender;
  final BookModel? book;

  const BookCoverTile({
    super.key,
    this.onTap,
    required this.isDecorationImg,
    required this.book,
    this.isRender = true,
  });

  @override
  Widget build(BuildContext context) {
    return isRender
        ? AspectRatio(
            aspectRatio: 2.5 / 4,
            child: isDecorationImg
                ? Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(
                            book!.volumeInfo.imageLinks!.thumbnail),
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
                      'https://placehold.co/250x375.png',
                      fit: BoxFit.cover,
                    ),
                  ),
          )
        : const SizedBox();
  }
}

import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionButtons extends StatelessWidget {
  final BookModel book;
  const BookActionButtons({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return book.saleInfo!.retailPrice != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomFilledButton(
                buttonText:
                    'EGP ${book.saleInfo!.retailPrice!.amount!.toStringAsFixed(2)}',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                onPressed: () async {
                  final Uri url = Uri.parse(book.saleInfo!.buyLink!);
                  await launchUrl(url);
                },
              ),
              CustomFilledButton(
                buttonText: 'Free Preview',
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  final Uri url = Uri.parse(book.volumeInfo.previewLink!);
                  await launchUrl(url);
                },
              ),
            ],
          )
        : CustomFilledButton(
            buttonText: 'Preview',
            borderRadius: BorderRadius.circular(16),
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {},
          );
  }
}

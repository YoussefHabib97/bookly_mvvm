import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onSubmitted: (value) {},
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Search",
        alignLabelWithHint: true,
        enabledBorder: buildOutlineInputBorder(context),
        focusedBorder: buildOutlineInputBorder(context),
        prefixIcon: IconButton(
          onPressed: () {
            AppRouter.router.pop();
          },
          icon: const Opacity(
            opacity: 0.75,
            child: Icon(Icons.arrow_back),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: 0.75,
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.inverseSurface),
    );
  }
}

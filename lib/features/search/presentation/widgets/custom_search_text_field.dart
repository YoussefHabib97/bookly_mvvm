import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onSubmitted: (value) async {
        value.trim().isNotEmpty
            ? await BlocProvider.of<SearchCubit>(context)
                .searchForBooks(searchTerms: value.trim())
            : null;
      },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.text,
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
            child: Tooltip(
              message: 'Back',
              child: Icon(Icons.arrow_back),
            ),
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

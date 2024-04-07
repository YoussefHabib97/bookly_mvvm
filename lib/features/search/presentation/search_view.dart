import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchTextField(),
          ],
        ),
      ),
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {},
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          label: const Text("Search"),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: 0.75,
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/atoms/buttons/search_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _State();
}

class _State extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchButton(
          controller: TextEditingController(),
          onChanged: (value) {},
          readOnly: true,
        ),
      ),
      body: const Center(
        child: Text('Search Screen'),
      ),
    );
  }
}

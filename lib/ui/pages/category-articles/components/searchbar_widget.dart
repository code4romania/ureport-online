import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required this.onSearchChanged,
    required this.focusNode,
  }) : super(key: key);

  final FocusNode focusNode;

  final Function(String value)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: Colors.black)),
        child: TextField(
          focusNode: focusNode,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 16, color: Colors.black),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
            ),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(228, 228, 231, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

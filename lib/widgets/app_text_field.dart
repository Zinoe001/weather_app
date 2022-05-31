import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key,required this.controller, required this.onSubmitted, }) : super(key: key);
final Function(String)? onSubmitted;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kAccentColor.shade300),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmitted,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none
        ),
      ),
    );
  }
}

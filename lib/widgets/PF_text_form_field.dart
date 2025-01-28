import 'package:flutter/material.dart';

class PFTextFormField extends StatelessWidget {
  final TextEditingController? nameController;
  const PFTextFormField({@required this.nameController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.none,
      maxLength: 7,
      maxLines: null,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.grey.shade800,
      ),
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: "PF Number",
        hintStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.grey.shade800,
        ),
        labelText: "",
        labelStyle: TextStyle(color: Colors.grey.shade800),
      ),
      onTap: () {},
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "PF Number is required";
        } else if (value.length < 7) {
          return "PF Number length should be at list 7";
        }
        return null;
      },
    );
  }
}

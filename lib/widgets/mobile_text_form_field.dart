import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextFormField extends StatelessWidget {
  final TextEditingController? numberController;
  const NumberTextFormField({@required this.numberController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberController,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.grey.shade700,
      textCapitalization: TextCapitalization.none,
      maxLength: 50,
      maxLines: null,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.grey.shade800,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9]'),
        ),
      ],
      decoration: InputDecoration(
        prefix: Text(
          "+91 ",
          style: TextStyle(color: Colors.grey.shade800),
        ),
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
        hintText: "Your mobile number",
        hintStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.grey.shade800,
        ),
        labelText: "",
        labelStyle: TextStyle(color: Colors.grey.shade800),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Mobile number is required";
        } else if (value.length < 10) {
          return "Enter valid mobile number";
        } else if (value.length > 10) {
          return "Enter valid mobile number";
        }
        return null;
      },
    );
  }
}

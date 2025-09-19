import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    var formatted = '';
    for (int i = 0; i < digits.length && i < 9; i++) {
      formatted += digits[i];
      if (i == 2 || i == 5 || i == 7) formatted += ' ';
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class PhoneInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String icon;
  final bool enabled;

  const PhoneInput({
    Key? key,
    this.controller,
    this.hintText = '+998 000 000 00 00',
    this.icon = 'assets/icons/uzb.png',
    this.enabled = true,
  }) : super(key: key);

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(9),
        PhoneInputFormatter(),
      ],
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.greyColor,
          fontSize: 15,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 20, right: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.icon,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        filled: true,
        fillColor: widget.enabled
            ? AppColors.searchColor.withOpacity(0.2)
            : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        counterText: '',
      ),
    );
  }
}

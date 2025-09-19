import 'package:flutter/material.dart';

class AppCheck extends StatefulWidget {
  final String label;
  final Color? activeColor;
  final TextStyle? labelStyle;
  final ValueChanged<bool>? onChanged; // Qo‘shildi

  const AppCheck({
    super.key,
    required this.label,
    this.activeColor,
    this.labelStyle,
    this.onChanged, // Qo‘shildi
  });

  @override
  State<AppCheck> createState() => _AppCheckState();
}

class _AppCheckState extends State<AppCheck> {
  bool _isChecked = false;

  void _checkboxChanged(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
      widget.onChanged?.call(_isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _checkboxChanged,
          activeColor: widget.activeColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Text(
          widget.label,
          style: widget.labelStyle ??
              const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}

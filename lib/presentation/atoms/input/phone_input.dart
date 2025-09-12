import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class PhoneInputFormatter extends TextInputFormatter {
  static const _country = '998';
  static const _prefix = '+$_country ';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (!digits.startsWith(_country)) digits = _country + digits;
    if (digits.length > 12) digits = digits.substring(0, 12); // 998 + 9 digits

    final core = digits.substring(3); // after 998
    final pattern = [2, 3, 2, 2];
    final buf = StringBuffer(_prefix);
    int index = 0;
    for (final size in pattern) {
      if (index >= core.length) break;
      final end = (index + size > core.length) ? core.length : index + size;
      buf.write(core.substring(index, end));
      index = end;
      if (index < core.length) buf.write(' ');
    }
    final formatted = buf.toString();
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
  final bool readOnly;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final VoidCallback? onCountryTap;

  const PhoneInput({
    Key? key,
    this.controller,
    this.hintText = '+998 90 000 00 00',
    this.icon = 'assets/icons/uzb.png',
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.onCountryTap,
  }) : super(key: key);

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  static const _prefix = '+998 ';
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _ownController = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller =
        widget.controller ?? (TextEditingController()..text = _prefix);
    _ownController = widget.controller == null;
    if (_controller.text.isEmpty) {
      _controller.text = _prefix;
      _controller.selection = const TextSelection.collapsed(offset: 5);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (_ownController) _controller.dispose();
    super.dispose();
  }

  void _handleKey(RawKeyEvent e) {
    if (e is! RawKeyDownEvent) return;
    final key = e.logicalKey;
    if (key == LogicalKeyboardKey.backspace) {
      if (_controller.selection.start <= 5 || _controller.text.length <= 5) {
        _controller.text = _prefix;
        _controller.selection = const TextSelection.collapsed(offset: 5);
        widget.onChanged?.call(_controller.text);
      }
    } else if (key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter) {
      if (_controller.text.replaceAll(' ', '').length >= 12) {
        widget.onSubmitted?.call(_controller.text);
        _focusNode.unfocus();
      }
    }
  }

  void _onChanged(String v) {
    widget.onChanged?.call(v);
    if (v.replaceAll(' ', '').length >= 12 && widget.onSubmitted != null) {
      Future.microtask(() => widget.onSubmitted?.call(v));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: _handleKey,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        inputFormatters: [PhoneInputFormatter()],
        onChanged: _onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: () {
          if (_controller.text.length <= 5) {
            _controller.selection = const TextSelection.collapsed(offset: 5);
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              const TextStyle(color: AppColors.greyscaleColor, fontSize: 15),
          prefixIcon: GestureDetector(
            onTap: widget.onCountryTap,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(widget.icon, width: 24, height: 24),
                  const SizedBox(width: 8),
                  Icon(Icons.keyboard_arrow_down,
                      color: widget.onCountryTap != null
                          ? AppColors.primaryColor
                          : Colors.grey),
                ],
              ),
            ),
          ),
          filled: true,
          fillColor: widget.enabled
              ? (widget.readOnly
                  ? Colors.grey[50]
                  : AppColors.searchColor.withOpacity(0.2))
              : Colors.grey[100],
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
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          counterText: '',
        ),
      ),
    );
  }
}

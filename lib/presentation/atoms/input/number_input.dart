import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class NumberInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool enabled;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;

  const NumberInput({
    super.key,
    this.controller,
    this.enabled = true,
    this.onChanged,
    this.readOnly = false,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (final c in _controllers) {
      c.addListener(_updateMainController);
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _updateMainController() {
    final code = _controllers.map((c) => c.text).join();
    widget.controller?.text = code;
    widget.onChanged?.call(code);
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        _checkAndSubmit();
      }
    }
  }

  void _checkAndSubmit() {
    final fullCode = _controllers.map((c) => c.text).join();
    if (fullCode.length == 4) {
      widget.onSubmitted?.call(fullCode);
    }
  }

  void _onKeyDown(KeyEvent event, int index) {
    if (event is! KeyDownEvent) return;

    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].clear();
      }
    } else if (event.logicalKey == LogicalKeyboardKey.enter || 
               event.logicalKey == LogicalKeyboardKey.numpadEnter) {
      _checkAndSubmit();
    }
  }

  Widget _buildInputField(int index) {
    return Container(
      width: 70,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) => _onKeyDown(event, index),
        child: TextField(
          readOnly: widget.readOnly,
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          enabled: widget.enabled,
          textInputAction: index == 3 
              ? (widget.textInputAction ?? TextInputAction.done)
              : TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.enabled
                ? AppColors.searchColor.withOpacity(0.2)
                : Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
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
          onChanged: (v) => _onChanged(v, index),
          onSubmitted: (_) => _checkAndSubmit(),
          onTap: () {
            _controllers[index].selection = TextSelection(
              baseOffset: 0,
              extentOffset: _controllers[index].text.length,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, _buildInputField),
    );
  }
}
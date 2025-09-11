import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class NumberInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool enabled;
  final Function(String)? onChanged;

  const NumberInput({
    super.key,
    this.controller,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
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
    if (value.isNotEmpty && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isNotEmpty) {
      _focusNodes[index].unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        return Container(
          width: 70,
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            enabled: widget.enabled,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.enabled ? AppColors.secondaryColor : Colors.grey[100],
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
            onChanged: (v) => _onChanged(v, i),
            onTap: () {
              _controllers[i].selection = TextSelection(
                baseOffset: 0,
                extentOffset: _controllers[i].text.length,
              );
            },
          ),
        );
      }),
    );
  }
}

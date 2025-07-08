import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class InputBar extends StatefulWidget {
  const InputBar(
    this.hintText, {
    super.key,
    required this.onSend,
    this.controller,
    this.showAttachIcon = true,
    this.enabled = true,
    this.isLoading = false,
    this.onAttach,
  });

  final String hintText;
  final TextEditingController? controller;
  final Function(String text) onSend;
  final bool showAttachIcon;
  final bool enabled;
  final bool isLoading;
  final VoidCallback? onAttach;

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !widget.isLoading) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      onSubmitted: (_) => _sendMessage(),
      decoration: InputDecoration(
        fillColor: ColorPalette.snowWhiteColor,
        filled: true,
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        prefixIcon: widget.showAttachIcon
            ? IconButton(
                onPressed: widget.onAttach,
                icon: const Icon(Icons.attach_file),
              )
            : null,
        suffixIcon: IconButton(
          onPressed: widget.isLoading ? null : _sendMessage,
          icon: widget.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.send),
        ),
      ),
    );
  }
}

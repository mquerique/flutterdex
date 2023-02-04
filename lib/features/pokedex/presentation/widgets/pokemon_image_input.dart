import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterdex/core/localization/app_localization.dart';

class PokemonImageInput extends StatefulWidget {
  final void Function(String? filePath)? onChanged;

  const PokemonImageInput({
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonImageInput> createState() => _PokemonImageInputState();
}

class _PokemonImageInputState extends State<PokemonImageInput> {
  static const _imageSize = 100.0;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: SizedBox(
        width: _imageSize,
        height: _imageSize,
        child: Stack(
          children: [
            _imagePath == null ? _buildEmptyImage() : _buildFiledImage(),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      _imagePath = result?.files.single.path;
    });
    widget.onChanged?.call(_imagePath);
  }

  Widget _buildEmptyImage() {
    const color = Colors.grey;
    return Container(
      alignment: Alignment.center,
      width: _imageSize,
      height: _imageSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: Text(
        AppLocalization.of(context).tr('add_image'),
        textAlign: TextAlign.center,
        style: const TextStyle(color: color),
      ),
    );
  }

  Widget _buildFiledImage() {
    final file = File(_imagePath!);
    return Image.file(file);
  }
}

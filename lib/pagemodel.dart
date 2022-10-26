import 'package:flutter/material.dart';

class PageModel {
  String _titles;
  IconData _icons;
  String _images;

  PageModel(this._titles, this._icons, this._images);
  String get images => _images;
  String get titles => _titles;
  IconData get icons => _icons;
}

import 'package:flutter/services.dart';
import 'package:martva/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_size.repo.g.dart';

@riverpod
class ImageSizeRepo extends _$ImageSizeRepo {
  @override
  Future<List<int>> build() async {
    final String jsonString = await rootBundle.loadString(Assets.images.large);

    final list = jsonString.split(',').map<int>((e) => int.parse(e)).toList();

    return list;
  }
}

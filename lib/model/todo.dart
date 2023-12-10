import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';
// todoコレクションのドキュメントを表すモデルクラス
@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    @Default('') String title,// formから保存した値を保持するtitle
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

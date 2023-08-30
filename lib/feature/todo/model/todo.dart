import 'package:flutterfire_json_converters/flutterfire_json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class ToDo with _$ToDo {
  const ToDo._();
  factory ToDo({
    /// 将来的にFirestoreに依存しなくなることもありうる。
    /// そのため、DocumentReferenceではなくidのみを持たせる設計とする
    String? id,

    /// updateAtはこう書く
    /// 今回は詳しくは説明しない。
    @alwaysUseServerTimestampSealedTimestampConverter
    @Default(ServerTimestamp())
    SealedTimestamp updatedAt,

    /// createdAtはこう書く
    /// 今回は詳しくは説明しない。
    @sealedTimestampConverter
    @Default(ServerTimestamp())
    SealedTimestamp createdAt,

    /// todoの説明
    @Default('') String description,

    /// 完了済みかどうか
    @Default(false) bool isCompleted,
  }) = _ToDo;

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);
}

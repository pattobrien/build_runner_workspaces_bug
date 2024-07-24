import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_b.g.dart';

@JsonSerializable()
class FooB {
  const FooB(this.name);
  final String name;

  factory FooB.fromJson(Map<String, dynamic> json) => _$FooBFromJson(json);

  Map<String, dynamic> toJson() => _$FooBToJson(this);
}

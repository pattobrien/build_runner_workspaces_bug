import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_a.g.dart';

@JsonSerializable()
class FooA {
  const FooA(this.name);
  final String name;

  factory FooA.fromJson(Map<String, dynamic> json) => _$FooAFromJson(json);

  Map<String, dynamic> toJson() => _$FooAToJson(this);
}

import 'package:hi_flutter/hi_flutter.dart';

class Language extends HiModel {
  final String? name;

  const Language({
    super.id,
    this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json.stringForKey('urlParam'),
        name: json.stringForKey('name'),
      );

  @override
  Map<String, dynamic> toJson() => {
        'urlParam': id,
        'name': name,
      };

  Language copyWith({
    String? id,
    String? name,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}

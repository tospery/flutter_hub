import 'package:hi_flutter/hi_flutter.dart';

class Card extends HiModel {
  final String? name;
  final String? icon;
  final String? url;

  const Card({
    super.id,
    this.name,
    this.icon,
    this.url,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json.stringForKey('id'),
        name: json.stringForKey('name'),
        icon: json.stringForKey('icon'),
        url: json.stringForKey('url'),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'url': url,
      };

  Card copyWith({
    String? id,
    String? name,
    String? icon,
    String? url,
  }) {
    return Card(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, icon, url];
}

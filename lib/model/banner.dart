import 'package:hi_flutter/hi_flutter.dart';
import 'card.dart';

class Banner extends HiModel {
  final List<Card>? cards;

  const Banner({
    super.id,
    this.cards,
  });

  factory Banner.myDefault() => const Banner(
        cards: [
          Card(
              name: 'HiSwift',
              icon: 'res/images/banner_card_01.png',
              url: 'https://github.com/tospery/HiSwift'),
          Card(
              name: 'SwiftHub',
              icon: 'res/images/banner_card_02.png',
              url: 'https://github.com/tospery/SwiftHub'),
          Card(
              name: 'hi_flutter',
              icon: 'res/images/banner_card_03.png',
              url: 'https://github.com/tospery/SwiftHub'),
          Card(
              name: 'flutter_github',
              icon: 'res/images/banner_card_04.png',
              url: 'https://github.com/tospery/SwiftHub'),
          Card(
              name: 'cpp',
              icon: 'res/images/banner_card_05.png',
              url: 'https://github.com/tospery/SwiftHub'),
        ],
      );

  // tags: (json['tags'] as List<dynamic>?)
  //     ?.map((e) => Tag.fromJson(e as Map<String, dynamic>? ?? {}))
  //     .toList(),
  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json.stringForKey('id'),
        cards: json
            .listForKey<Map>('cards')
            ?.map((e) => Card.fromJson(e as Map<String, dynamic>? ?? {}))
            .toList(),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'cards': cards,
      };

  Banner copyWith({
    String? id,
    List<Card>? cards,
  }) {
    return Banner(
      id: id ?? this.id,
      cards: cards ?? this.cards,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, cards];
}

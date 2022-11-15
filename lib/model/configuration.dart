import 'package:hi_flutter/hi_flutter.dart';

class Configuration extends HiConfiguration {
  final String? token;

  const Configuration({
    super.id,
    super.codeKeys,
    super.messageKeys,
    super.dataKeys,
    this.token,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        id: json.stringForKey('id'),
        codeKeys: json.listForKey<String>('codeKeys'),
        messageKeys: json.listForKey<String>('messageKeys'),
        dataKeys: json.listForKey<String>('dataKeys'),
        token: json.stringForKey('token'),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'codeKeys': codeKeys,
        'messageKeys': messageKeys,
        'dataKeys': dataKeys,
        'token': token,
      };

  @override
  Configuration copyWith({
    String? id,
    List<String>? codeKeys,
    List<String>? messageKeys,
    List<String>? dataKeys,
    String? token,
  }) {
    return Configuration(
      id: id ?? this.id,
      codeKeys: codeKeys ?? this.codeKeys,
      messageKeys: messageKeys ?? this.messageKeys,
      dataKeys: dataKeys ?? this.dataKeys,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [id, codeKeys, messageKeys, dataKeys, token];
}

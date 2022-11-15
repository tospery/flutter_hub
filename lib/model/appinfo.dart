import 'package:hi_flutter/hi_flutter.dart';

class AppInfo extends HiModel {
  final String? name;
  final String? version;
  final String? icon;

  const AppInfo({
    super.id,
    this.name,
    this.version,
    this.icon,
  });

  factory AppInfo.myDefault() => AppInfo(
        name: HiPackageManager.shared().name,
        version:
            'v${HiPackageManager.shared().version}(${HiPackageManager.shared().buildNumber})',
        icon: R.assets.images.appIcon,
      );

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        id: json.stringForKey('id'),
        name: json.stringForKey('name'),
        version: json.stringForKey('version'),
        icon: json.stringForKey('icon'),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };

  AppInfo copyWith({
    String? id,
    String? name,
    String? version,
    String? icon,
  }) {
    return AppInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      version: version ?? this.version,
      icon: icon ?? this.icon,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, version, icon];
}

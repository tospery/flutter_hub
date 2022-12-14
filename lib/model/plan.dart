import 'package:hi_flutter/hi_flutter.dart';

class Plan extends HiModel {
  final String? name;
  final int? space;
  final int? collaborators;
  final int? privateRepos;

  const Plan({
    super.id,
    this.name,
    this.space,
    this.collaborators,
    this.privateRepos,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json.stringForKey('id'),
        name: json.stringForKey('name'),
        space: json.intForKey('space'),
        collaborators: json.intForKey('collaborators'),
        privateRepos: json.intForKey('private_repos'),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'space': space,
        'collaborators': collaborators,
        'private_repos': privateRepos,
      };

  Plan copyWith({
    String? id,
    String? name,
    int? space,
    int? collaborators,
    int? privateRepos,
  }) {
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name,
      space: space ?? this.space,
      collaborators: collaborators ?? this.collaborators,
      privateRepos: privateRepos ?? this.privateRepos,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, space, collaborators, privateRepos];
}

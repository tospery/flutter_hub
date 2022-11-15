import 'package:flutter/material.dart';
import 'package:flutter_hub/model/plan.dart';
import 'package:flutter_hub/resource/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

enum UserCellType {
  chart;

  factory UserCellType.fromValue(int value) =>
      {
        0: UserCellType.chart,
      }[value] ??
      UserCellType.chart;
}

class User extends HiUser {
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? hireable;
  final String? bio;
  final String? twitterUsername;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final String? createdAt;
  final String? updatedAt;
  final int? privateGists;
  final int? totalPrivateRepos;
  final int? ownedPrivateRepos;
  final int? diskUsage;
  final int? collaborators;
  final bool? twoFactorAuthentication;
  final Plan? plan;
  // 扩展属性
  final UserCellType cellType;

  get charUrlString => 'https://ghchart.rshah.org/1CA035/$username';

  get joinedText {
    if (createdAt == null) {
      return '';
    }
    if (createdAt!.length < 10) {
      return R.strings.joinedOn.tr + createdAt!;
    }
    return R.strings.joinedOn.tr + createdAt!.substring(0, 10);
  }

  Widget numText(String str, int count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          str,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  const User({
    super.id,
    super.username,
    super.password,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.privateGists,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
    this.diskUsage,
    this.collaborators,
    this.twoFactorAuthentication,
    this.plan,
    this.cellType = UserCellType.chart,
  });

  factory User.myDefault() {
    var string = HiCache.shared().get<String>(HiKey.user);
    var json = string?.toJsonObject();
    var user = User.fromJson(json ?? {});
    log('user: ${user.bio}');
    return user;
  }

  // factory User.myDefault2() {
  //   var string = HiCache.shared().get<String>(HiKey.user);
  //   var json = string?.toJsonObject();
  //   var user = User.fromJson(json ?? {});
  //   log('user222: ${myuser.toJsonString()}');
  //   return myuser;
  // }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json.stringForKey('id'),
        username: json.stringForKey('login'),
        nodeId: json.stringForKey('node_id'),
        avatarUrl: json.stringForKey('avatar_url'),
        gravatarId: json.stringForKey('gravatar_id'),
        url: json.stringForKey('url'),
        htmlUrl: json.stringForKey('html_url'),
        followersUrl: json.stringForKey('followers_url'),
        followingUrl: json.stringForKey('following_url'),
        gistsUrl: json.stringForKey('gists_url'),
        starredUrl: json.stringForKey('starred_url'),
        subscriptionsUrl: json.stringForKey('subscriptions_url'),
        organizationsUrl: json.stringForKey('organizations_url'),
        reposUrl: json.stringForKey('repos_url'),
        eventsUrl: json.stringForKey('events_url'),
        receivedEventsUrl: json.stringForKey('received_events_url'),
        type: json.stringForKey('type'),
        name: json.stringForKey('name'),
        company: json.stringForKey('company'),
        blog: json.stringForKey('blog'),
        location: json.stringForKey('location'),
        email: json.stringForKey('email'),
        createdAt: json.stringForKey('created_at'),
        updatedAt: json.stringForKey('updated_at'),
        hireable: json.stringForKey('hireable'),
        twitterUsername: json.stringForKey('twitter_username'),
        bio: json.stringForKey('bio'),
        siteAdmin: json.boolForKey('site_admin'),
        twoFactorAuthentication: json.boolForKey('two_factor_authentication'),
        publicRepos: json.intForKey('public_repos'),
        publicGists: json.intForKey('public_gists'),
        followers: json.intForKey('followers'),
        following: json.intForKey('following'),
        privateGists: json.intForKey('private_gists'),
        totalPrivateRepos: json.intForKey('total_private_repos'),
        ownedPrivateRepos: json.intForKey('owned_private_repos'),
        diskUsage: json.intForKey('disk_usage'),
        collaborators: json.intForKey('collaborators'),
        plan: json.mapForKey('plan') == null
            ? null
            : Plan.fromJson(json.mapForKey('plan')!),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'login': username,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
        'name': name,
        'company': company,
        'blog': blog,
        'location': location,
        'email': email,
        'hireable': hireable,
        'bio': bio,
        'twitter_username': twitterUsername,
        'public_repos': publicRepos,
        'public_gists': publicGists,
        'followers': followers,
        'following': following,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'private_gists': privateGists,
        'total_private_repos': totalPrivateRepos,
        'owned_private_repos': ownedPrivateRepos,
        'disk_usage': diskUsage,
        'collaborators': collaborators,
        'two_factor_authentication': twoFactorAuthentication,
        'plan': plan?.toJson(),
      };

  @override
  User copyWith({
    String? id,
    String? username,
    String? password,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    String? hireable,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
    int? privateGists,
    int? totalPrivateRepos,
    int? ownedPrivateRepos,
    int? diskUsage,
    int? collaborators,
    bool? twoFactorAuthentication,
    Plan? plan,
    UserCellType? cellType,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      privateGists: privateGists ?? this.privateGists,
      totalPrivateRepos: totalPrivateRepos ?? this.totalPrivateRepos,
      ownedPrivateRepos: ownedPrivateRepos ?? this.ownedPrivateRepos,
      diskUsage: diskUsage ?? this.diskUsage,
      collaborators: collaborators ?? this.collaborators,
      twoFactorAuthentication:
          twoFactorAuthentication ?? this.twoFactorAuthentication,
      plan: plan ?? this.plan,
      cellType: cellType ?? this.cellType,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      username,
      password,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
      bio,
      twitterUsername,
      publicRepos,
      publicGists,
      followers,
      following,
      createdAt,
      updatedAt,
      privateGists,
      totalPrivateRepos,
      ownedPrivateRepos,
      diskUsage,
      collaborators,
      twoFactorAuthentication,
      plan,
    ];
  }
}

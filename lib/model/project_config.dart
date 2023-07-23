import 'package:equatable/equatable.dart';

class ProjectConfig extends Equatable {
  final String url;
  final String name;
  final String desc;
  final String id;

  const ProjectConfig({
    required this.id,
    required this.url,
    required this.name,
    required this.desc,
  });

  @override
  List<Object?> get props => [
        url,
        name,
        desc,
        id,
      ];
}

const List<ProjectConfig> projectConfigs = [];

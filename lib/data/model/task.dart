import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final int icon;
  final int color;
  final List<dynamic>? todos;
  const Task({
    required this.title,
    required this.icon,
    required this.color,
    this.todos,
  });

  Task copyWith({
    String? title,
    int? icon,
    int? color,
    List<dynamic>? todos,
  }) =>
      Task(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        todos: todos ?? this.todos,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"],
        icon: json["icon"],
        color: json["color"],
        todos: json["todos"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "color": color,
        "todos": todos,
      };

  @override
  List<Object?> get props => [title, icon, color];
}

// class Task {
//   late String title;
//   late int icon;
//   int? color;
//   List<dynamic>? todos;
//   Task({
//     required this.title,
//     required this.icon,
//     this.color,
//     this.todos,
//   });

//   Task.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     icon = json['icon'];
//     color = json['color'];
//     todos = json['todose'];
//   }

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "icon": icon,
//         "color": color,
//         "todos": todos,
//       };
//   Task copyWith({
//     String? title,
//     int? icon,
//     int? color,
//     List<dynamic>? todos,
//   }) =>
//       Task(
//         title: title ?? this.title,
//         icon: icon ?? this.icon,
//         color: color ?? this.color,
//         todos: todos ?? this.todos,
//       );
// }

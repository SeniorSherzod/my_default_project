import 'category_constants.dart';

class CategoryModel{
  final int? id;
  final String name;
  final String iconPath;
  final String color;

  CategoryModel({
    this.id,
    required this.name,
    required this.iconPath,
    required this.color,

});
  CategoryModel copyWith({
    int? id,
    String? name,
    String? iconPath,
    String? color,
}){
    return CategoryModel(
        name: name ?? this.name,
        iconPath: iconPath ?? this.iconPath,
        color: color ?? this.color,
    );
  }
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      iconPath: json[CategoryModelConstants.iconPath] as String? ?? "",
      name: json[CategoryModelConstants.name] as String? ?? "",
      color: json[CategoryModelConstants.color] as String? ?? "",
      id: json[CategoryModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryModelConstants.name: name,
      CategoryModelConstants.iconPath: iconPath,
      CategoryModelConstants.color: color,
    };
  }

  bool canAddTaskToDatabase() {
    if (name.isEmpty) return false;
    if (iconPath.isEmpty) return false;
    if (color.isEmpty) return false;
    return true;
  }

  static CategoryModel initialValue = CategoryModel(
    iconPath: "",
    name: "",
    color: "",
  );
}
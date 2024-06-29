// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguagesModel {
  int id;
  String name;
  String languageCode;
  LanguagesModel({
    required this.id,
    required this.name,
    required this.languageCode,
  });

  LanguagesModel copyWith({
    int? id,
    String? name,
    String? languageCode,
  }) {
    return LanguagesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'languageCode': languageCode,
    };
  }

  factory LanguagesModel.fromMap(Map<String, dynamic> map) {
    return LanguagesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      languageCode: map['languageCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguagesModel.fromJson(String source) =>
      LanguagesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LanguagesModel(id: $id, name: $name, languageCode: $languageCode)';

  @override
  bool operator ==(covariant LanguagesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.languageCode == languageCode;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ languageCode.hashCode;
}

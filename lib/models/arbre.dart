import 'dart:convert';

class Arbre {
  Arbre({
    required this.nom,
    required this.varietat,
    required this.tipus,
    required this.autocton,
    required this.foto,
    required this.detall,
  });

  String nom;
  String varietat;
  String tipus;
  String autocton;
  String foto;
  String detall;

  // Convertir de JSON (String) a arbre
  factory Arbre.fromJson(String str) => Arbre.fromMap(json.decode(str));

  // Convertir de arbre a JSON (String)
  String toJson() => json.encode(toMap());

  // Crear un arbre a partir de un Map
  factory Arbre.fromMap(Map<String, dynamic> json) => Arbre(
        nom: json["nom"],
        varietat: json["varietat"],
        tipus: json["tipus"],
        autocton: json["autocton"],
        foto: json["foto"],
        detall: json["detall"],
      );

  // Convertir un arbre a Map
  Map<String, dynamic> toMap() => {
        "nom": nom,
        "varietat": varietat,
        "tipus": tipus,
        "autocton": autocton,
        "foto": foto,
        "detall": detall,
      };

  // Método para crear una copia de un arbre con la posibilnomad de cambiar algunos campos
  Arbre copy({
    String? nom,
    String? varietat,
    String? tipus,
    String? autocton,
    String? foto,
    String? detall,
  }) =>
      Arbre(
        nom: nom ?? this.nom,
        varietat: varietat ?? this.varietat,
        tipus: tipus ?? this.tipus,
        autocton: autocton ?? this.autocton,
        foto: foto ?? this.foto,
        detall: detall ?? this.detall,
      );
}

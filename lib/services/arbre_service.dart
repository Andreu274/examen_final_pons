import 'dart:convert';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArbreService extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _baseUrl =
      "examen-2bd6e-default-rtdb.us-central1.firebasedatabase.app"; // Updated URL
  List<Arbre> arbres = [];
  late Arbre tempArbre;
  Arbre? newArbre;

  ArbreService() {
    this.loadArbres();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  loadArbres() async {
    arbres.clear();
    final url = Uri.https(_baseUrl, 'arbres.json');
    final response = await http.get(url);
    final Map<String, dynamic> arbresMap = json.decode(response.body);

    // Mapejam la resposta del servidor, per cada arbre, el convertim a la classe i l'afegim a la llista
    arbresMap.forEach((key, value) {
      final auxarbre = Arbre.fromMap(value);
      auxarbre.nom = key;
      arbres.add(auxarbre);
    });

    notifyListeners();
  }

  Future saveOrCreateArbre() async {
    if (tempArbre.nom == null) {
      
      await this.createArbre();
    } else {
      
      await this.updateArbre();
    }
    loadArbres();
  }

  updateArbre() async {
    final url = Uri.https(_baseUrl, 'arbres/${tempArbre.nom}.json');
    final response = await http.put(url, body: tempArbre.toJson());
    final decodedData = response.body;
  }

  createArbre() async {
    final url = Uri.https(_baseUrl, 'arbres.json');
    final response = await http.post(url, body: tempArbre.toJson());
    final decodedData = json.decode(response.body);
  }

  deleteArbre(Arbre arbre) async {
    final url = Uri.https(_baseUrl, 'arbres/${arbre.nom}.json');
    final response = await http.delete(url);
    final decodedData = json.decode(response.body);
    print(decodedData);
    loadArbres();
  }
}

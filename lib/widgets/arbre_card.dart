
import 'package:flutter/material.dart';

import '../models/models.dart';

class ArbreCard extends StatelessWidget {
  final Arbre arbre;
  const ArbreCard({super.key, required this.arbre});

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      leading: CircleAvatar(child: Text(arbre.nom[0])), 
      title: Text(Arbre.fromJson(arbre.toJson()).nom),
      subtitle: Text(
        arbre.varietat, 
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
    );
  }
}

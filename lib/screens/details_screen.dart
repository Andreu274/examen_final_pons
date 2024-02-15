
// ignore_for_file: body_might_complete_normally_nullable

import 'package:examen_final_pons/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arbreForm = Provider.of<ArbreService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: _arbreForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (arbreForm.isValidForm()) {
            arbreForm.saveOrCreateArbre();
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

class _arbreForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arbreForm = Provider.of<ArbreService>(context);
    final tempArbre = arbreForm.tempArbre;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: arbreForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                if (tempArbre.foto.isNotEmpty)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        tempArbre.foto,
                        width: 100, 
                        height: 100, 
                        fit: BoxFit.cover, 
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: tempArbre.nom,
                  onChanged: (value) => tempArbre.nom = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre', labelText: 'Nombre:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempArbre.varietat,
                  onChanged: (value) => tempArbre.varietat = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'La varietat es obligatoria';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Variedad', labelText: 'Variedad:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempArbre.tipus,
                  onChanged: (value) => tempArbre.tipus = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'El tipo es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Tipo', labelText: 'Tipo:'),
                ),
                SizedBox(height: 30),
                  TextFormField(
                  initialValue: tempArbre.detall,
                  onChanged: (value) => tempArbre.detall = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'URL del detalle', labelText: 'detalle:'),
                ),

                SizedBox(height: 30),
                  TextFormField(
                  initialValue: tempArbre.foto,
                  onChanged: (value) => tempArbre.foto = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'URL de la foto', labelText: 'Foto:'),
                ),

                SizedBox(height: 30),
                  TextFormField(
                  initialValue: tempArbre.autocton,
                  onChanged: (value) => tempArbre.autocton = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'autocton: si/no', labelText: 'si/no:'),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5),
        ],
      );
}




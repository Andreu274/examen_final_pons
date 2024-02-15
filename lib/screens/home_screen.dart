import 'package:examen_final_pons/models/arbre.dart';
import 'package:examen_final_pons/services/arbre_service.dart';
import 'package:examen_final_pons/ui/loading.dart';
import 'package:examen_final_pons/widgets/arbre_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arbreService = Provider.of<ArbreService>(context);
    List<Arbre> arbres = arbreService.arbres;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: arbres.isEmpty
          ? Loading()
          : ListView.builder(
              itemCount: arbres.length,
              itemBuilder: ((context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  child: GestureDetector(
                    child: ArbreCard(arbre: arbres[index]),
                    onTap: () {
                      arbreService.tempArbre = arbres[index].copy();
                      Navigator.of(context).pushNamed('detail');
                    },
                  ),
                  onDismissed: (direction) {
                    if (arbres.length < 2) {
                      arbreService.loadArbres();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('No es pot esborrar tots els elements!')));
                    } else {
                      arbreService.deleteArbre(arbres[index]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${arbreService.arbres[index].nom} esborrat')));
                    }
                  },
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Cream un arbre temporal nou, per diferenciar-lo d'un ja creat,
          // per que aquest no tindrà id encara, i d'aquesta forma sabrem
          // discernir al detailscreen que estam creant un arbre nou i no
          // modificant un existent
          arbreService.tempArbre = Arbre(
              nom: 'nom',
              varietat: '',
              tipus: '',
              autocton: '',
              foto: '',
              detall: '');
          Navigator.of(context).pushNamed('details');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

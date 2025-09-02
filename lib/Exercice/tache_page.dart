import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tache_bloc.dart';

class TachePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TachePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestion de Taches"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Nouvelle Tache"
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TacheBloc>().add(AjouterTache(_controller.text));
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TacheBloc, TacheState>(
              builder: (context, state) {
                final taches = (state is TacheMisAjour) ? state.taches : [];
                
                if (taches.isEmpty) {
                  return const Center(child: Text("Aucune tache"),);
                }
                
                return ListView.builder(
                  itemCount: taches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(taches[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TacheBloc>().add(SupprimerTache(index));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Définir le provider
final favorisProvider = StateNotifierProvider<FavorisNotifier, List<String>>(
      (ref) => FavorisNotifier(),
);

// StateNotifier pour gérer les favoris
class FavorisNotifier extends StateNotifier<List<String>> {
  FavorisNotifier() : super([]);

  void ajouterFavori(String favori) {
    if (favori.isNotEmpty && !state.contains(favori)) {
      state = [...state, favori];
    }
  }

  void supprimerFavori(int index) {
    if (index >= 0 && index < state.length) {
      final newList = List<String>.from(state);
      newList.removeAt(index);
      state = newList;
    }
  }
}

// Widget pour afficher les favoris
class FavorisPage extends ConsumerWidget {
  const FavorisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoris = ref.watch(favorisProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
      ),
      body: favoris.isEmpty
          ? const Center(
        child: Text(
          'Aucun favori ajouté',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favoris.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoris[index]),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                ref.read(favorisProvider.notifier).supprimerFavori(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _afficherDialogAjouter(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _afficherDialogAjouter(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter un favori'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Nom du favori',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              final nouveauFavori = controller.text.trim();
              if (nouveauFavori.isNotEmpty) {
                ref.read(favorisProvider.notifier).ajouterFavori(nouveauFavori);
                Navigator.pop(context);
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
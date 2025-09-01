import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Modele Todo
class Todo with ChangeNotifier {
  String titre;
  bool estTermine;

  Todo({required this.titre, this.estTermine = false});

  void toggleTermine() {
    estTermine = !estTermine;
    notifyListeners();
  }
}

//Modele listeTodo
class ListeTodo with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void ajouterTodo(String titre) {
    _todos.add(Todo(titre: titre));
    notifyListeners();
  }

  void supprimerTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}

//Consumer listeTodo
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Consumer<ListeTodo>(
        builder: (context, listeTodo, child) {
          return ListView.builder(
            itemCount: listeTodo.todos.length,
            itemBuilder: (context, index) {
              final todo = listeTodo.todos[index];
              return ListTile(
                title: Text(
                  todo.titre,
                  style: TextStyle(
                    decoration: todo.estTermine ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Checkbox(
                  value: todo.estTermine,
                  onChanged: (value) {
                    todo.toggleTermine();
                  },
                ),
                onLongPress: () {
                  listeTodo.supprimerTodo(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _afficherDialogAjouter(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _afficherDialogAjouter(BuildContext context) {
    String nouveauTitre = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ajouter une tache'),
        content: TextField(
          onChanged: (value) {
            nouveauTitre = value;
          },
          decoration: InputDecoration(hintText: 'Titre de la tache'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<ListeTodo>(context, listen: false).ajouterTodo(nouveauTitre);
              Navigator.pop(context);
            },
            child: Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
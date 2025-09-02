import 'package:flutter_bloc/flutter_bloc.dart';

//evenements
abstract class TacheEvent{}

class AjouterTache extends TacheEvent {
  final String titre;
  AjouterTache(this.titre);
}

class SupprimerTache extends TacheEvent {
  final int index;
  SupprimerTache(this.index);
}

//etats
abstract class TacheState{}

class TacheInitial extends TacheState {
  final List<String> taches = [];
}

class TacheMisAjour extends TacheState {
  final List<String> taches;
  TacheMisAjour(this.taches);
}

//Bloc
class TacheBloc extends Bloc<TacheEvent, TacheState> {
  TacheBloc() : super (TacheInitial()) {
    //Ajouter tache
    on<AjouterTache>((event, emit) {
      final currentState = state;

      if(currentState is TacheInitial) {
        final nouvellesTaches =
            List<String>.from(currentState.taches)..add(event.titre);
        emit(TacheMisAjour(nouvellesTaches));
      } else if (currentState is TacheMisAjour) {
        final nouvellesTaches =
            List<String>.from(currentState.taches)..add(event.titre);
        emit(TacheMisAjour(nouvellesTaches));
      }
    });

    //supprimer tache
    on<SupprimerTache>((event, emit) {
      final currentState = state;
      if(currentState is TacheMisAjour) {
        final nouvellesTaches =
            List<String>.from(currentState.taches)..removeAt(event.index);
        emit(TacheMisAjour(nouvellesTaches));
      }
    });
  }
}
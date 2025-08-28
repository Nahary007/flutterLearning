import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo facebook
              Text(
                "facebook",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40,),

              //champ email
              TextField(
                decoration: InputDecoration(
                  hintText: "Numéro de mobile ou e-mail",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15,),

              //champ mot de passe
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),

              //bouton se connecter
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      //to do: action connexion
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15)
                    ),
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                ),
              ),
              const SizedBox(height: 15,),

              //Mot de passe oublié
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Mot de passe oublié?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20,),

              //separateur
              Row(
                children: const[
                  Expanded(child: Divider(thickness: 1,)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OU"),
                  ),
                  Expanded(child: Divider(thickness: 1,))
                ],
              ),
              const SizedBox(height: 20,),

              //creer un compte
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15)
                    ),
                    child: const Text(
                      "Créer un compte",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

//StatelessWidget
class Exo2 extends StatelessWidget {
  const Exo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Image + Badge VIP
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child : Image.network('https://i.pravatar.cc/150?img=3', width: 100,height: 100, fit: BoxFit.cover,)
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'VIP',
                  style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),

          SizedBox(height: 16),

          //Nom et description

          Column(
            children: [
              Text(
                'Nahary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 4),
              Text(
                'Développeur passionné par l’éducation et la créativité',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              )
            ],
          ),

          SizedBox(height: 26),

          //Boutons
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('Suivre'), style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),)
              ),
              SizedBox(width: 12),
              Expanded(child: OutlinedButton(onPressed: () {}, child: Text('Message'))),
            ],
          )
        ],
      ),
    );
  }
}
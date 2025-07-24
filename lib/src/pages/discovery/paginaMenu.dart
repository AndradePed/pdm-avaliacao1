import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/discovery/bar/bar.dart';
import 'package:flutter_application_1/src/pages/discovery/fine_dinning/fine_dinning.dart';
import 'package:flutter_application_1/src/pages/discovery/cafes/cafes.dart';
import 'package:flutter_application_1/src/pages/discovery/nearby/mapa.dart';
import 'package:flutter_application_1/src/pages/discovery/fast_foods/fast_foods.dart';
import 'package:flutter_application_1/src/pages/discovery/foods/foods.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // backgroundColor: Color(Colors.grey)
      padding: EdgeInsets.all(20),
      child: Column(
        // padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bar()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 1 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/cerveja.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Bars & Hotels',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('42 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dinning()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 2 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/bandeja.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Fine Dinning',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('15 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cafes()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 3 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/cafe.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Cafes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('28 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 4;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Mapa()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 4 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/rota.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Nearby',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('34 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FastFoods()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 5 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/fastfood.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Fast Foods',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('29 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 6;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Foods()),
                  );
                  print('Você Clicou, foi um teste');
                },
                child: Container(
                  width: 160,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedIndex == 6 ? Colors.amber : Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons_menu/melhores.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Featured Foods',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('21 place', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

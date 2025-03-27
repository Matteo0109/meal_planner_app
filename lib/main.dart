// lib/main.dart
import 'package:flutter/material.dart';

// Importer les écrans depuis leurs fichiers respectifs
import 'screens/calendar_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/shopping_list_screen.dart';

void main() {
  runApp(const MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  const MealPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planificateur de Repas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        // Personnalisation optionnelle des couleurs du FAB et de la sélection Navbar
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.amber[800], // Utilisé par défaut pour le FAB
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber[800], // Couleur item sélectionné Navbar
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Mettre à jour la liste des écrans pour utiliser les classes importées
  static const List<Widget> _widgetOptions = <Widget>[
    CalendarScreen(),
    RecipesScreen(), // Utilise notre nouvel écran
    ShoppingListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
      ),
      body: IndexedStack( // IndexedStack préserve l'état des écrans lors du changement d'onglet
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recettes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Courses',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800], // Déplacé dans le thème global
        onTap: _onItemTapped,
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Calendrier';
      case 1:
        return 'Mes Recettes';
      case 2:
        return 'Liste de Courses';
      default:
        return 'Planificateur';
    }
  }
}
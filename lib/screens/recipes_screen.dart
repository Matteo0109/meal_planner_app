import 'package:flutter/material.dart';
import '../../models/recipe.dart'; // Importer notre modèle Recipe

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  // Liste de recettes factice pour l'instant
  final List<Recipe> _recipes = [
    Recipe(
      id: 'r1',
      name: 'Pâtes Carbonara',
      ingredients: [
        Ingredient(name: 'Spaghetti', quantity: '400g'),
        Ingredient(name: 'Guanciale', quantity: '150g'),
        Ingredient(name: 'Oeufs', quantity: '4'),
        Ingredient(name: 'Pecorino', quantity: '100g'),
        Ingredient(name: 'Poivre noir', quantity: 'à volonté'),
      ],
      instructions: 'Faire cuire les pâtes. Pendant ce temps, faire revenir le guanciale...',
    ),
    Recipe(
      id: 'r2',
      name: 'Salade César',
      ingredients: [
        Ingredient(name: 'Laitue romaine', quantity: '1'),
        Ingredient(name: 'Poulet grillé', quantity: '200g'),
        Ingredient(name: 'Croûtons', quantity: '1 tasse'),
        Ingredient(name: 'Parmesan', quantity: '50g'),
        Ingredient(name: 'Sauce César', quantity: 'au goût'),
      ],
    ),
    Recipe(
      id: 'r3',
      name: 'Soupe de légumes',
      ingredients: [
        Ingredient(name: 'Carottes', quantity: '2'),
        Ingredient(name: 'Pommes de terre', quantity: '2'),
        Ingredient(name: 'Poireau', quantity: '1'),
        Ingredient(name: 'Bouillon de légumes', quantity: '1L'),
      ],
      instructions: 'Couper les légumes, faire revenir, ajouter le bouillon, mijoter.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // On enlève l'AppBar ici car elle est déjà dans MainScreen
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (ctx, index) {
          final recipe = _recipes[index];
          return ListTile(
            title: Text(recipe.name),
            // On pourrait ajouter une flèche ou autre chose ici
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action future: Naviguer vers les détails de la recette
              print('Recette sélectionnée: ${recipe.name}');
               // TODO: Implémenter la navigation vers l'écran de détails
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action future: Naviguer vers l'écran de création de recette
          print('Ajouter une nouvelle recette');
          // TODO: Implémenter la navigation vers l'écran de création/modification
        },
        tooltip: 'Ajouter une recette',
        child: const Icon(Icons.add),
      ),
    );
  }
}

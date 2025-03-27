// lib/models/recipe.dart

class Ingredient {
  final String name;
  final String quantity; // Ex: "200g", "1 unité", "à volonté"

  Ingredient({required this.name, required this.quantity});
}

class Recipe {
  final String id; // Pour identifier de manière unique une recette
  final String name;
  final List<Ingredient> ingredients;
  final String? instructions; // Optionnel
  final String? imageUrl; // Optionnel, chemin ou URL de l'image

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    this.instructions,
    this.imageUrl,
  });
}
import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meal.dart';

const dummy_categories = const [
  Category(
    id: '10',
    title: 'Italian',
    color: Colors.black54,
  ),
  Category(
    id: '11',
    title: 'Chinese',
    color: Colors.grey,
  ),
  Category(
    id: '12',
    title: 'Korian',
    color: Colors.blue,
  ),
  Category(
    id: '13',
    title: 'Japanese',
    color: Colors.indigo,
  ),
  Category(
    id: '14',
    title: 'Spicey',
    color: Colors.lime,
  ),
  Category(
    id: '15',
    title: 'Spanish',
    color: Colors.grey,
  ),
  Category(
    id: '16',
    title: 'Italian Veg',
    color: Colors.black54,
  ),
  Category(
    id: '17',
    title: 'Chinese Spicey',
    color: Colors.orange,
  ),
  Category(
    id: '18',
    title: 'Italian',
    color: Colors.blue,
  ),
];
const dummy_meals = const [
  Meal(
      id: '1',
      categories: ['10', '11'],
      title: 'Spanish Masala',
      imageUrl: 'https://picsum.photos/200/150',
      ingredients: null,
      steps: null,
      duration: 10,
      complexity: Complexity.Hard,
      affordability: Affordability.Luxurious,
      isGlutenFree: null,
      isLactoseFree: null,
      isVegan: null,
      isVegetarian: false),
  Meal(
      id: '2',
      categories: ['10', '11', '12'],
      title: 'Chinese Noodles',
      imageUrl: 'https://picsum.photos/210/160',
      ingredients: null,
      steps: null,
      duration: 10,
      complexity: Complexity.Hard,
      affordability: Affordability.Luxurious,
      isGlutenFree: null,
      isLactoseFree: null,
      isVegan: null,
      isVegetarian: false),
  Meal(
      id: '3',
      categories: ['10', '11', '12'],
      title: 'Chicken Masala',
      imageUrl: 'https://picsum.photos/210/170',
      ingredients: null,
      steps: null,
      duration: 15,
      complexity: Complexity.Simple,
      affordability: Affordability.Affordable,
      isGlutenFree: null,
      isLactoseFree: null,
      isVegan: null,
      isVegetarian: false),
];

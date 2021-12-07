/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020, 2021 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wger/models/nutrition/meal.dart';
import 'package:wger/models/nutrition/nutritional_plan.dart';
import 'package:wger/models/nutrition/meal_item.dart';
import 'package:wger/models/nutrition/nutritional_values.dart';
import 'package:wger/models/nutrition/ingredient.dart';

import '../test_data/nutritional_plans.dart';
import 'nutritional_plan_form_test.mocks.dart';

void main() {
  final meal1 = Meal(
    time: TimeOfDay(hour: 7, minute: 10),
    id: 1,
    plan: 1,
    name: 'test meal 1',
  );

  final meal2 = Meal(
    time: TimeOfDay(hour: 7, minute: 30),
    id: 2,
    plan: 1,
    name: 'test meal 2',
  );

  final meal3 = Meal(
    time: TimeOfDay(hour: 7, minute: 40),
    id: 3,
    plan: 1,
    name: 'test meal 3',
  );

  final meal4 = Meal(
    time: TimeOfDay(hour: 8, minute: 25),
    id: 4,
    plan: 1,
    name: 'test meal 4',
  );

  final ingredient3 = Ingredient(
    id: 3,
    name: 'Broccoli cake',
    creationDate: DateTime(2021, 5, 2),
    energy: 1200,
    carbohydrates: 110,
    carbohydratesSugar: 2,
    protein: 9,
    fat: 10,
    fatSaturated: 8,
    fibres: 1,
    sodium: 10,
  );

  final mealItem3 = MealItem(
    ingredientId: 3,
    amount: 100,
  );
  mealItem3.ingredientObj = ingredient3;

  final NutritionalPlan plan =
      NutritionalPlan(id: 5, description: 'test plan', creationDate: DateTime(2021));
  plan.meals = [meal1, meal2, meal3];

  group('check plan containing meals', () {
    test('Test if the meal is or is not saved', () {
      expect(plan.meals.contains(meal1), true);
      expect(plan.meals.contains(meal2), true);
      expect(plan.meals.contains(meal3), true);
      expect(plan.meals.contains(meal4), false);
    });

    test('Test if the meal if saved in right order', () {
      expect(plan.meals.elementAt(0).name, 'test meal 1');
      expect(plan.meals.elementAt(1).name, 'test meal 2');
      expect(plan.meals.elementAt(2).name, 'test meal 3');
    });

    test('Test to check nutritional value', () {
      meal4.mealItems = [mealItem3];
      expect(meal4.nutritionalValues, NutritionalValues.values(1200, 9, 110, 2, 10, 8, 1, 10));
    });
  });
}

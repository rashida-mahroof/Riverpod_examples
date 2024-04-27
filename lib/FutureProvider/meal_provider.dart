import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_expample_app/FutureProvider/meal_model.dart';
import 'package:dio/dio.dart';


final randomMealProvider = FutureProvider<Meal>((ref) async{
  final dio = Dio();
  final response = await dio.get('https://www.themealdb.com/api/json/v1/1/random.php');

  return Meal.fromJson(response.data['meals'][0]);
});
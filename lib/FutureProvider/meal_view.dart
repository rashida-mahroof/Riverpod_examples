
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_expample_app/FutureProvider/meal_model.dart';
import 'package:riverpod_expample_app/FutureProvider/meal_provider.dart';

class RandomMealView extends ConsumerWidget {
  const RandomMealView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Meal> getRandomMeal = ref.watch(randomMealProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()=> ref.refresh(randomMealProvider.future),
        child:Center(child:getRandomMeal.when(data: (data){
          return Center(child: ListView(
            
            children: [
               Text(data.strMeal ??''),
            Text(data.strArea ??''),
            Text(data.strCategory ??''),
           
          ],));
        }, error: (err, stk){
          return Text(err.toString());
        }, loading: (){
          return CircularProgressIndicator();
        }) ,) ,
        
       
      ),
    );
  }
}
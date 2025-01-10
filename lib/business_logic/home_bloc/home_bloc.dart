import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeState {
//   final List<Map<String, String>> items;
//   final bool isLoading;

//   HomeState({this.items = const [], this.isLoading = false});
// }

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeState());

//   void fetchItems() {
//     emit(HomeState(isLoading: true));

//     // Mock data fetching
//     Future.delayed(Duration(seconds: 2), () {
//       emit(HomeState(items: [
//         {'name': 'Item 1', 'description': 'Description of Item 1'},
//         {'name': 'Item 2', 'description': 'Description of Item 2'},
//       ]));
//     });
//   }
// }


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:primehealth/domain/model/items_model.dart';


class HomeState {
  final List<Item> items;
  final bool isLoading;

  HomeState({this.items = const [], this.isLoading = false});
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void fetchItems() async {
    emit(HomeState(isLoading: true));

    try {
      // Load the JSON file
      final String jsonString = await rootBundle.loadString('assets/data/items.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // Map JSON data to Item model
      final items = jsonData.map((data) => Item.fromJson(data)).toList();

      emit(HomeState(items: items));
    } catch (e) {
      emit(HomeState());
    }
  }
}


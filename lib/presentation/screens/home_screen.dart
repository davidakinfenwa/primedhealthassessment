import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:primehealth/business_logic/home_bloc/home_bloc.dart';
import 'package:primehealth/presentation/widget/network_image.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..fetchItems(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Home')),
            body: state.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                  leading:SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: NetworkImageUtil(networkImage: item.image))),
                  title: Text(item.title),
                  subtitle: Text("\$${item.discountPrice} (Original: \$${item.price})"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: item,
                    );
                  },
                );
                    },
                  ),
          );
        },
      ),
    );
  }
}

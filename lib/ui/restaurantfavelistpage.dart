import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dbprovider.dart';
import '../widgets/cardresto.dart';

class RestaurantFaveListPage extends StatelessWidget {
  const RestaurantFaveListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<DbProvider>(
      builder: (context, provider, child) {
        final arrRestoFave = provider.restos;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: arrRestoFave.length,
            itemBuilder: (context, index) {
              var resto = arrRestoFave[index];
              return CardResto(resto: resto);
            },
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/restosearch_provider.dart';
import '../widgets/cardresto.dart';

// enum ResultState { loading, noData, hasData, error }

class SearchRestaurantListPage extends StatelessWidget {
  const SearchRestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Expanded(
      child: Consumer<RestoSearchProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants?.length,
              itemBuilder: (context, index) {
                var resto = state.result.restaurants![index];
                return CardResto(resto: resto);
              },
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
    // return Scaffold(
    //   body: _buildList(),
    // );
  }
}

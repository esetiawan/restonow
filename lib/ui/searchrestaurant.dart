import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/ui/searchrestaurantlistpage.dart';
import '../provider/restosearch_provider.dart';
import '../data/api/api_service.dart';

class SearchRestaurantsListScreen extends StatefulWidget {
  static const routeName = '/search_restaurant';

  const SearchRestaurantsListScreen({Key? key}) : super(key: key);

  @override
  State<SearchRestaurantsListScreen> createState() =>
      _SearchRestaurantsListScreenState();
}

class _SearchRestaurantsListScreenState
    extends State<SearchRestaurantsListScreen> {
  //final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: ChangeNotifierProvider<RestoSearchProvider>(
        create: (context1) => RestoSearchProvider(
            apiService: ApiService(), query: ""),
        child: Column(children: <Widget> [
                      TextField(
                        autofocus: true,
                        onChanged: (val) {
                          Provider.of<RestoSearchProvider>(context, listen: false).
                            changeQuery(val);
                        },
                        decoration: const InputDecoration(labelText: "Topic"),
                      ),
                      const SearchRestaurantListPage()]
                          )

                      ),
                  );
  }

  @override
  void initState() {

  }
}

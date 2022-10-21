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
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: ChangeNotifierProvider<RestoSearchProvider>(
        create: (_) => RestoSearchProvider(
            apiService: ApiService(), query: _searchController.text),
        child: SingleChildScrollView(
            child: Column(children: [
          TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: (val) {
              setState(() {
                _searchController.text = val.toString();
                Provider.of<RestoSearchProvider>(context, listen: false).query =
                    val.toString();
                Provider.of<RestoSearchProvider>(context, listen: false)
                    .notifyListeners();
              });
            },
            decoration: const InputDecoration(labelText: "Topic"),
          ),
          Container(
            width: 200,
              height: 200,
              child: Builder(
                builder: (context) {
                  return SearchRestaurantListPage();
                }
              )
              // child: Text("haai"),
          ),
        ])),
      ),
    );
  }
}

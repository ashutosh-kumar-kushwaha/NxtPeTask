import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/listing_view_model.dart';


class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {

  ListingViewModel listingViewModel = ListingViewModel();

  @override
  void initState() {
    listingViewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Products", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ChangeNotifierProvider<ListingViewModel>(
          create: (BuildContext context) => listingViewModel,
          child: Consumer<ListingViewModel>(
              builder: (context, value, _){
                return Container();
              },
            )
        )
    );
  }
}
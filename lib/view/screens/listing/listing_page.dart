import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:next_pe_task/utils/routes_name.dart';
import 'package:provider/provider.dart';
import '../../../data/response/status.dart';
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
              builder: (context, value, _) {
                switch (value.products.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.SUCCESS:
                    return RefreshIndicator(
                      onRefresh: () => listingViewModel.getProducts(),
                      child: ListView.builder(
                          itemCount: value.products.data?.products?.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: ListTile(
                              leading: Image.network(
                                value.products.data?.products![index]
                                        .thumbnail ??
                                    "",
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                  value.products.data?.products![index].title ??
                                      ""),
                              subtitle: Text(
                                  "\$${value.products.data?.products![index].price.toString()}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(value.products.data?.products![index]
                                          .rating
                                          .toString() ??
                                      ""),
                                  const Icon(Icons.star, color: Colors.grey)
                                ],
                              ),
                              onTap: () {
                                context.goNamed(RoutesName.details,
                                    pathParameters: {
                                      "id":
                                          "${value.products.data!.products![index].id}"
                                    });
                              },
                            ));
                          }),
                    );

                  default:
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text(value.products.message.toString()),
                          ElevatedButton(
                              onPressed: () {
                                listingViewModel.getProducts();
                              },
                              child: const Text("Reload"))
                        ]));
                }
              },
            )));
  }
}

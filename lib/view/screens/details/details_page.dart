import 'package:flutter/material.dart';
import 'package:next_pe_task/data/response/status.dart';
import 'package:next_pe_task/view_model/product_detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  ProductDetailsViewModel viewModel = ProductDetailsViewModel();

  @override
  void initState() {
    viewModel.getProductDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailsViewModel>(
          create: (BuildContext context) => viewModel,
          child: Consumer<ProductDetailsViewModel>(
              builder: (context, value, _){
                switch (value.product.status){
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.SUCCESS:
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(value.product.data?.title?? "", style: const TextStyle(color: Colors.white)),
                        centerTitle: true,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      body: Column(
                        children: [
                          Image.network(value.product.data?.images![0]?? "")
                        ],
                      )
                    );
                  case Status.ERROR:
                    return Text(value.product.message.toString());
                  
                  case null: return Container();
                }
              },
            )
        );
  }
}
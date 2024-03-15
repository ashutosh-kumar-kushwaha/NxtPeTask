import 'package:flutter/material.dart';
import 'package:next_pe_task/data/response/status.dart';
import 'package:next_pe_task/utils/platform_helper.dart';
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
                return Scaffold(
                      appBar: AppBar(
                        title: Text(value.product.data?.title?? "", style: const TextStyle(color: Colors.white)),
                        centerTitle: true,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      body:  (value.product.status == Status.LOADING)?
                     const Center(
                      child: CircularProgressIndicator(),
                    )
                 : (value.product.status == Status.SUCCESS)?
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(
                            value.product.data?.thumbnail?? "",
                            height: 300,
                            width: 300,
                            ),
                            Text(value.product.data?.title?? "", style: const TextStyle(color: Colors.white)),
                            Text(value.product.data?.description?? "", style: const TextStyle(color: Colors.white)),
                            Text(value.product.data?.price.toString()?? "", style: const TextStyle(color: Colors.white)),
                            Text(value.product.data?.category?? "", style: const TextStyle(color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(onPressed: () {
                                buyProduct();
                              }, child: const Text("Buy Product")),
                            ],
                          )
                        ],
                      ):
               Center(
                      child: Text(value.product.message.toString())
                    )
                
                      
                      
                      
                     
                    );
               
              },
            )
        );
  }
}
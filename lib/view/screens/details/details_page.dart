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
          builder: (context, value, _) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(value.product.data?.title ?? "",
                      style: const TextStyle(color: Colors.white)),
                  centerTitle: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                body: SingleChildScrollView(
                  child: (value.product.status == Status.LOADING)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (value.product.status == Status.SUCCESS)
                          ? Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.network(
                                    value.product.data?.thumbnail ?? "",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(value.product.data?.description ?? ""),
                                  const SizedBox(height: 10),
                                  Text(
                                      "Price: \$${value.product.data?.price.toString()}"),
                                  const SizedBox(height: 10),
                                  Text(
                                      "Category: ${value.product.data?.category}"),
                                  const SizedBox(height: 50),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            buyProduct();
                                          },
                                          child: const Text("Buy Product")),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text(value.product.message.toString()),
                                  ElevatedButton(
                                      onPressed: () {
                                        viewModel.getProductDetails(widget.id);
                                      },
                                      child: const Text("Reload"))
                                ])),
                ));
          },
        ));
  }
}

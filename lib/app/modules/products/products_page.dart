import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/components/custom_drawer/custom_drawer_widget.dart';
import 'components/product_list_tile/product_list_tile_widget.dart';
import 'components/search_dialog/search_dialog_widget.dart';
import 'products_controller.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Products"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState
    extends ModularState<ProductsPage, ProductsController> {
  //use 'controller' variable to access controller

  void showSearch() async {
    String search = await Modular.to.showDialog(
        builder: (_) =>
            SearchDialogWidget(initialValue: controller.productStore.search));
    if (search != null) {
      controller.productStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (_) {
          return controller.productStore.search.isEmpty
              ? Text('Produtos')
              : LayoutBuilder(builder: (_, constraints) {
                  return GestureDetector(
                    onTap: showSearch,
                    child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        controller.productStore.search,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                });
        }),
        actions: [
          Observer(
            builder: (_) {
              return controller.productStore.search.isEmpty
                  ? IconButton(
                      icon: Icon(Icons.search),
                      onPressed: showSearch,
                    )
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () async {
                        controller.productStore.setSearch('');
                      },
                    );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          var products = controller.productStore.filteredProducts;
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: products.length,
            itemBuilder: (_, i) {
              return ProductListTileWidget(
                product: products[i],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Modular.to.pushNamed('/cart');
        },
      ),
    );
  }
}

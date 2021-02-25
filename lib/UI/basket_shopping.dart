import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/shopping_provider.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shopProvider = Provider.of<Shoping>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: shopProvider.eklenenUrunSayisi() == null
              ? 0
              : shopProvider.eklenenUrunSayisi(),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading: CircleAvatar(
                    child: Text("$index"),
                  ),
                  title: Text(shopProvider.urunGetir(index).name +
                      " " +
                      shopProvider.urunGetir(index).fiyat.toString() + "TL "),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      shopProvider.urunSil(index);
                    },
                  )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Text(shopProvider.eklenenUrunSayisi().toString()),
        onPressed: null,
      ),
    );
  }
}

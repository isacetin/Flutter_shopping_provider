import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppController.dart';
import '../shop_item.dart';
import '../shoppingProvider.dart';
import 'basket_shopping.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenIndex = 0;
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<AppController>(context, listen: false);
    var shopProvider = Provider.of<Shoping>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(),
      appBar: buildAppBar(myProvider, shopProvider),
      body: buildPageView(),
    );
  }

  PageView buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (seciliSayfa) {
        setState(() {
          secilenIndex = seciliSayfa;
        });
      },
      children: [myHomePageBody(), BasketPage()],
    );
  }

  AppBar buildAppBar(AppController myProvider, Shoping shoping) {
    return AppBar(
      elevation: 0,
      title: Text("AnaSayfa"),
      actions: [
        Center(child: Text("${context.watch<Shoping>().FiyatGetir().toString()} TL")),
        IconButton(
          icon: myProvider.getTheme()
              ? Icon(Icons.brightness_2)
              : Icon(Icons.brightness_1_outlined),
          onPressed: () {
            myProvider.changeTheme();
          },
        )
      ],
    );
  }

  Widget myHomePageBody() => ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        var items = ShopItem("$index. Ürün", 2 * index);
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text(items.name + " " + items.fiyat.toString() + "TL"),
            trailing: IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                context.read<Shoping>().urunEkle(items);
              },
            ),
          ),
        );
      });

  Widget bottomNavigatorBar() => BottomNavigationBar(
        elevation: 8,
        currentIndex: secilenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Basket"),
        ],
        onTap: (seciliIndex) {
          setState(() {
            secilenIndex = seciliIndex;
          });
          pageController.jumpToPage(secilenIndex);
        },
      );
}

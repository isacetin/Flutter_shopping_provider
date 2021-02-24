
import 'package:flutter/cupertino.dart';

import 'shop_item.dart';

class Shoping extends ChangeNotifier{

  List<ShopItem> urunler = [];

  void urunEkle( ShopItem shopItem){
    urunler.add(shopItem);
    notifyListeners();
  }

  ShopItem urunGetir(int index){
    return urunler[index];
  }

  int eklenenUrunSayisi(){
    return urunler.length;
  }

  void urunSil(int index){
    urunler.removeAt(index);
    notifyListeners();
  }

  int FiyatGetir(){
    int toplamFiyat = 0;
    for(int i =0; i<urunler.length;i++){
      toplamFiyat += urunler[i].fiyat;
    }
    return toplamFiyat;
  }

}
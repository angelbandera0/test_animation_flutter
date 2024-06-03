import 'dart:math';

class Coffe{
  final String name;
  final String url;
  final double price;

  Coffe({ required this.price, required this.name, required this.url});
  
}
class CoffeeListGenerator{
  final _names = ["Caramel Macchiato",
      "Caramel Cold Drink",
      "Iced Coffe Mocha",
      "Caramelized Pecan Latte",
      "Toffee Nut Latte",
      "Capuchino",
      "Toffee Nut Iced Latte",
      "Americano",
      "Vietnamese-Style Iced Coffee",
      "Black Tea Latte",
      "Classic Irish Coffee",
      "Toffee Nut Crunch Latte"];
  List<Coffe> generate(){
    final random = Random();
    return List.generate(12, (index){
      return new Coffe(name: _names[index], url: "assets/coffee/${index+1}.png",price: random.nextDouble()*(3-7)+4);
    });
  }
}
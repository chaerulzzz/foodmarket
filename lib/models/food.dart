part of 'models.dart';

class Food extends Equatable{
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});

  @override
  List<Object> get props => [id,picturePath,name,description,ingredients,price,rate];
}

List<Food> mockFoods = [
  Food(
  id: 1,
  picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
  name: "Sate Sayur Sultan",
  description: "Sate Sayur Sultan adalah makanan terenak dan terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan",
  ingredients: "Bawang merah, Paprika, Bawang bombay, Timun",
  price: 15000,
  rate: 4.2,
),
Food(
  id: 2,
  picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
  name: "Sate Sayur Sultan 2",
  description: "Sate Sayur Sultan adalah makanan terenak dan terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan",
  ingredients: "Bawang merah, Paprika, Bawang bombay, Timun",
  price: 15002,
  rate: 4.2
),
Food(
  id: 3,
  picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
  name: "Sate Sayur Sultan 3",
  description: "Sate Sayur Sultan adalah makanan terenak dan terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan",
  ingredients: "Bawang merah, Paprika, Bawang bombay, Timun",
  price: 15003,
  rate: 4.2
),
Food(
  id: 4,
  picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
  name: "Sate Sayur Sultan 4",
  description: "Sate Sayur Sultan adalah makanan terenak dan terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan",
  ingredients: "Bawang merah, Paprika, Bawang bombay, Timun",
  price: 15004,
  rate: 4.2
),
Food(
  id: 5,
  picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
  name: "Sate Sayur Sultan 5",
  description: "Sate Sayur Sultan adalah makanan terenak dan terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan",
  ingredients: "Bawang merah, Paprika, Bawang bombay, Timun",
  price: 15005,
  rate: 4.2
)
];

part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath
  });

  @override
  List<Object> get props => [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: "Chaerul Anwar",
  email: "chaerulforpc@gmail.com",
  address: "Jalan Gading Sengon IV",
  houseNumber: "111",
  phoneNumber: "+6281224748488",
  city: "Jakarta Utara",
  picturePath: "https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg"
);

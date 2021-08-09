part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockUser);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? picturePath, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register';

    var response = await client.post(Uri.http(url, ""),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "name": user.name ?? "",
          "email": user.email ?? "",
          "password": password,
          "password_confirmation": password,
          "address": user.address ?? "",
          "city": user.city ?? "",
          "houseNumber": user.houseNumber ?? "",
          "phoneNumber": user.phoneNumber ?? ""
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    Constant.token = data["data"]["access_token"];
    User value = data["data"]["user"];

    if (picturePath != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(picturePath);

      if (result.value != null) {
        value = value.copyWith(picturePath: baseImageUrl + result.value!);
      }
    }
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + "user/photo";
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${Constant.token}";
    }

    var multiPartFile =
        await http.MultipartFile.fromPath("file", pictureFile.path);
    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data["data"][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: "Uploading Profile Picture Failed");
    }
  }
}

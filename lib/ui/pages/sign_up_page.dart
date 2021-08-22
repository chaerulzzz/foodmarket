part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  User? user;
  File? profileFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool _passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign Up',
      subtitle: 'Register and eat',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                XFile? xfile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (xfile != null) {
                  profileFile = File(xfile.path);
                  setState(() {});
                }
              },
              child: Container(
                  width: 110,
                  height: 110,
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/photo_border.png"))),
                  child: (profileFile != null)
                      ? Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(profileFile!),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/photo.png"),
                                  fit: BoxFit.cover)),
                        )),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                'Full Name',
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextFormField(
                controller: nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintStyle: greyFontStyle,
                    hintText: 'Type your full name'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Name can't be empty";
                  }

                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                'Email Address',
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintStyle: greyFontStyle,
                    hintText: 'Type your email address'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Email can't be empty";
                  }

                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                'Password',
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _passwordVisibility,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon((_passwordVisibility)
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        }),
                    hintStyle: greyFontStyle,
                    hintText: 'Type your password'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Password can't be empty";
                  }

                  return null;
                },
              ),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => AddressPage(
                            user: User(
                                email: emailController.text,
                                name: nameController.text),
                            password: passwordController.text,
                            photoFile: profileFile,
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      primary: mainColor),
                  child: Text(
                    'Continue',
                    style: blackFontStyle3.copyWith(color: Colors.black),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

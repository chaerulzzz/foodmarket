part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String? buttonTitle2;
  final Function buttonTap1;
  final Function? buttonTap2;

  IllustrationPage(
      {required this.title,
      required this.subtitle,
      required this.picturePath,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonTap1,
      this.buttonTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picturePath))),
          ),
          Text(title, style: blackFontStyle3.copyWith(fontSize: 20)),
          Text(subtitle, style: greyFontStyle.copyWith(fontWeight: FontWeight.w300)),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: () => buttonTap1,
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(buttonTitle1, style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500)),
            ),
          ),
          (buttonTap2 == null) ? SizedBox() : SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: () => buttonTap2!,
              style: ElevatedButton.styleFrom(
                primary: '8D92A3'.toColor(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(buttonTitle2!, style: blackFontStyle3.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          )
        ],
    ));
  }
}

  
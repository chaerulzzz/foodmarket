part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  List<String> accountTab = ["Edit Profile", "Home Address", "Security", "Payments"];
  List<String> appTab = ["Rate App", "Help Center", "Privacy & Policy", "Terms & Conditions"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedBorder(
                borderType: BorderType.Circle,
                radius: Radius.circular(10),
                dashPattern: [1, 5],
                strokeWidth: 2,
                color: Colors.grey,
                child: Container(
                  width: 90,
                  height: 90,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/profile.png"), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 6),
                  child: Text(
                    "Chaerul Anwar",
                    style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600),
                  )),
              Text(
                "chaerulforpc@gmail.com",
                style: greyFontStyle.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Container(
            color: Colors.white,
            child: Column(
              children: [
                CustomTabBar(
                  titles: ["Account", "FoodMarket"],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                SizedBox(height: 16),
                Builder(builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: (selectedIndex == 0 ? accountTab : appTab).map((e) => Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10, left: defaultMargin, right: defaultMargin),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e, style: blackFontStyle3),
                          Icon(Icons.navigate_next, color: Colors.grey)
                      ])
                    )).toList(),
                  );
                })
              ],
            ))
      ],
    );
  }
}

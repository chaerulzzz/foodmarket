part of '../pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("FoodMarket", style: blackFontStyle),
                      Text("Lets get some food",
                          style: greyFontStyle.copyWith(
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  left: (e == mockFoods[0]) ? defaultMargin : 0,
                                  right: defaultMargin),
                              child: FoodCard(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(
                  titles: ["New", "Popular", "Recommended"],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  }),
              SizedBox(height: 16),
              Builder(builder: (_) {
                String body = (selectedIndex == 0)
                    ? "New Taste Body"
                    : (selectedIndex == 1)
                        ? "Popular Body"
                        : "Recommend Body";

                return Center(
                  child: Text(body, style: blackFontStyle2),
                );
              })
            ],
          ),
        )
      ],
    );
  }
}

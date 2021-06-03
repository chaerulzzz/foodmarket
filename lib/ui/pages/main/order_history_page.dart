part of '../pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions.where((element) =>
      element.status == TransactionStatus.on_delivery ||
      element.status == TransactionStatus.pending).toList();
  List<Transaction> inPast = mockTransactions.where((element) =>
      element.status == TransactionStatus.cancelled ||
      element.status == TransactionStatus.delivered).toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && inPast.length == 0) {
      return IllustrationPage(
        title: 'Ouch! Hungry',
        subtitle: 'Seems you like have not\n ordered any food yet',
        picturePath: 'assets/love_burger.png',
        buttonTap1: () {},
        buttonTitle1: 'Find Foods',
      );
    } else{
      double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;
      return ListView(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your Orders", style: blackFontStyle),
                    Text("Wait for the best meals", style: greyFontStyle.copyWith(fontWeight: FontWeight.w300))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(titles: ["In Progress", "Past Orders"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : inPast)
                          .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16, left: defaultMargin, right: defaultMargin),
                            child: OrderListItem(transaction: e, itemWidth: listItemWidth)))
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      );
    }
    
  }
}

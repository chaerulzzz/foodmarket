part of '../pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  MainPage(this.initialPage);
  
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _pageController = PageController(initialPage: _selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: "FAFAFC".toColor(),
            ),
          ),
          SafeArea(
              child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: [
              Center(
                child: FoodPage(),
              ),
              Center(child: OrderHistoryPage()),
              Center(
                child: ProfilePage(),
              )
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbar(
                selectedIndex: _selectedPage,
                onTap: (index) {
                  setState(() {
                    _selectedPage = index;
                  });

                  _pageController.jumpToPage(_selectedPage);
                },
              ))
        ],
      ),
    );
  }
}

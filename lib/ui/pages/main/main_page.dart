part of '../pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController(initialPage: 0);

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
                setState((){
                  _selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: IllustrationPage(
                    title: 'Ouch! Hungry',
                    subtitle: 'Seems you like have not\n ordered any food yet',
                    picturePath: 'assets/love_burger.png',
                    buttonTap1: () {},
                    buttonTitle1: 'Find Foods',
                  ),
                ),
                Center(
                  child: Text("Profile"),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter, 
            child: CustomBottomNavbar(
              selectedIndex: _selectedPage,
              onTap: (index) {
                setState((){
                  _selectedPage = index;
                });

                _pageController.jumpToPage(_selectedPage);
              },
            )
          )
        ],
      ),
    );
  }
}

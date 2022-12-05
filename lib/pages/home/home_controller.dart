class HomeController {
  int currentTab = 1;

  void onItemTapped({required int index}) {
    currentTab = index;
  }
}

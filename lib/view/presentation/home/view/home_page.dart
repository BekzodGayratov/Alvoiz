import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/services/local/audo_player_service.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_state.dart';
import 'package:alvoiz/view/presentation/home/view/main_page.dart';
import 'package:alvoiz/view/presentation/home/view/settings_page.dart';
import 'package:alvoiz/view/widgets/headline_two_text_widget.dart';
import 'package:alvoiz/view/widgets/player_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _screens = [MainPage(), SettingsPage()];
  @override
  void initState() {
    AudioPlayerService.audioPlayer.onPlayerStateChanged
        .listen((PlayerState event) {
      AudioPlayerService.audioState = event;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Al-Voiz"),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: _screens[_currentIndex]),
        bottomNavigationBar: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: BottomNavigationBar(
              backgroundColor: AlvoizThemeConfig.primaryColor,
              unselectedItemColor: AlvoizThemeConfig.secondaryColor,
              selectedItemColor: Colors.white,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Image.asset(
                          "assets/images/home/mosque.png",
                          color: _currentIndex == 0
                              ? Colors.white
                              : AlvoizThemeConfig.secondaryColor,
                        )),
                    label: "Asosiy"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Image.asset(
                          'assets/images/home/tasbeh.png',
                          color: _currentIndex == 1
                              ? Colors.white
                              : AlvoizThemeConfig.secondaryColor,
                        )),
                    label: "Sozlamalar")
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
      );
    });
  }
}

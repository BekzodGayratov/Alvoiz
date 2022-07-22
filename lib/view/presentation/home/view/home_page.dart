import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/services/local/audo_player_service.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_state.dart';
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                      color: AlvoizThemeConfig.primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.width * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02),
                          child: HeadlineTwoTextWidget(
                              child: AudioPlayerService.soundsTitles[index]),
                        ),

                        // GO TO PLAYER WIDGET TO CUSTOMIZE
                        PlayerWidget(index: index)
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: AudioPlayerService.soundsPath.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AudioPlayerService.stop();
          },
        ),
      );
    });
  }
}

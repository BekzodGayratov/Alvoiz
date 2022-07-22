import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/services/local/audo_player_service.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:alvoiz/view/widgets/headline_three_text_widget.dart';
import 'package:alvoiz/view/widgets/headline_two_text_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerWidget extends StatelessWidget {
  int index;
  PlayerWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.14,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                    AudioPlayerService.soundsStatus[index] == false
                        ? Icons.play_arrow
                        : Icons.pause,
                    size: 35.0,
                    color: AlvoizThemeConfig.iconColor),
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                )
              ],
            ),

            const HeadlineThreeTextWidget(child: "Nuriddin Nizomiddin")
          ],
        ),
      ),
    );
  }
}

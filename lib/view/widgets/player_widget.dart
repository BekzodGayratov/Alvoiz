import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/services/local/audo_player_service.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerWidget extends StatelessWidget {
  int index;
  PlayerWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_left,
                  color: AlvoizThemeConfig.iconColor,
                ),
                onPressed: () async {
                  await AudioPlayerService.back(
                      AudioPlayerService.soundsPath[index -= 1]);
                  Future.delayed(Duration.zero).then((value) {
                    context.read<HomeCubit>().emitter();
                  });
                }),
            IconButton(
              icon: Icon(
                  AudioPlayerService.soundsStatus[index] == false
                      ? Icons.play_arrow
                      : Icons.pause,
                  size: 35.0,
                  color: AlvoizThemeConfig.iconColor),
              onPressed: () async {
                if (AudioPlayerService.audioState == PlayerState.paused) {
                  AudioPlayerService.soundsStatus[index] = true;
                  await AudioPlayerService.play(
                      AudioPlayerService.soundsPath[index]);
                  Future.delayed(Duration.zero).then((value) {
                    context.read<HomeCubit>().emitter();
                  });
                } else if (AudioPlayerService.audioState ==
                    PlayerState.stopped) {
                  AudioPlayerService.soundsStatus[index] = true;
                  await AudioPlayerService.play(
                      AudioPlayerService.soundsPath[index]);
                  Future.delayed(Duration.zero).then((value) {
                    context.read<HomeCubit>().emitter();
                  });
                } else if (AudioPlayerService.audioState ==
                    PlayerState.playing) {
                  AudioPlayerService.soundsStatus[index] = false;
                  await AudioPlayerService.pause();
                  Future.delayed(Duration.zero).then((value) {
                    context.read<HomeCubit>().emitter();
                  });
                }
              },
            ),
            IconButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_right,
                  color: AlvoizThemeConfig.iconColor,
                ),
                onPressed: () async {
                  await AudioPlayerService.next(
                      AudioPlayerService.soundsPath[index += 1]);
                  Future.delayed(Duration.zero).then((value) {
                    context.read<HomeCubit>().emitter();
                  });
                }),
          ],
        ),
      ],
    );
  }
}

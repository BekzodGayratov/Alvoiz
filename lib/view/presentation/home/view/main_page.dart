import 'package:alvoiz/services/local/audo_player_service.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_state.dart';
import 'package:alvoiz/view/widgets/player_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: InkWell(
                onTap: () async {
                  AudioPlayerService.soundsStatus[
                      BlocProvider.of<HomeCubit>(context, listen: false)
                          .lastSound] = false;
                  AudioPlayerService.pause();

                  if (AudioPlayerService.audioState == PlayerState.paused) {
                    context.read<HomeCubit>().changeLastSound(index);
                    AudioPlayerService.soundsStatus[index] = true;

                    await AudioPlayerService.play(
                        AudioPlayerService.soundsPath[index]);
                    Future.delayed(Duration.zero).then((value) {
                      context.read<HomeCubit>().emitter();
                    });
                  } else if (AudioPlayerService.audioState ==
                      PlayerState.stopped) {
                    await AudioPlayerService.stop();
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
                child: PlayerWidget(index: index)),
          );
        },
        itemCount: AudioPlayerService.soundsPath.length,
      );
    });
  }
}

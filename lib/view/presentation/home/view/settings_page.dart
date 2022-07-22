import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/view/widgets/headline_two_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Card(
          color: AlvoizThemeConfig.primaryColor,
          child: ListTile(
            style: ListTileStyle.drawer,
            leading: const HeadlineTwoTextWidget(child: "Foydalanuvchi ismi:"),
            title: HeadlineTwoTextWidget(child: GetStorage().read('user')),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: AlvoizThemeConfig.secondaryColor,
                )),
          ),
        ),
      ],
    );
  }
}

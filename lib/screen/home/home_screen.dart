import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:roomgpt_mobile/screen/home/home_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomgpt_mobile/screen/home/widgets/picker.dart';
import 'package:roomgpt_mobile/screen/result/result_screen.dart';
import 'package:roomgpt_mobile/utils/constants.dart';
import 'package:roomgpt_mobile/utils/picker_bottom_sheet.dart';
import 'package:roomgpt_mobile/utils/state_status.dart';

part 'widgets/image_section.dart';
part 'widgets/room_type_picker.dart';
part 'widgets/room_theme_picker.dart';
part 'widgets/generate_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeManager homeManager = HomeManager();

  void _listenToState() {
    homeManager.stream.listen(
      (state) {
        if (state.status == StateStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Failed to generate room image, please try again later",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }

        if (state.status == StateStatus.success &&
            state.resultUrl.isNotEmpty &&
            state.pickedImage != null) {
          ResultScreen.open(
            context,
            file: File(state.pickedImage!.path),
            resultUrl: state.resultUrl,
          );
          return;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _listenToState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => homeManager,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageSection(),
                      SizedBox(height: 10),
                      RoomTypePicker(),
                      RoomThemePicker(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GenerateButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

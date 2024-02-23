part of '../home_screen.dart';

class RoomThemePicker extends StatelessWidget {
  const RoomThemePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<HomeManager>(context, listen: false).roomTheme$,
      builder: (context, snapshot) {
        final String roomTheme = snapshot.data ?? "";

        return Picker(
          title: "Select Room Theme",
          hintText: "Tap to select",
          onTap: () => pickRoomTheme(context),
          value: roomTheme,
        );
      },
    );
  }

  Future<void> pickRoomTheme(BuildContext context) async {
    final manager = Provider.of<HomeManager>(context, listen: false);

    final roomTheme = await PickerBottomSheet.show(
      context,
      title: "Room Theme",
      options: Constants.roomThemes,
      selected: manager.state.roomTheme,
    );

    if (roomTheme != null) {
      manager.setRoomTheme(roomTheme);
    }
  }
}

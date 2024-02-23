part of '../home_screen.dart';

class RoomTypePicker extends StatelessWidget {
  const RoomTypePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<HomeManager>(context, listen: false).roomType$,
      builder: (context, snapshot) {
        final String roomType = snapshot.data ?? "";

        return Picker(
          title: "Select Room Type",
          hintText: "Tap to select",
          onTap: () => pickRoomType(context),
          value: roomType,
        );
      },
    );
  }

  Future<void> pickRoomType(BuildContext context) async {
    final manager = Provider.of<HomeManager>(context, listen: false);

    final roomType = await PickerBottomSheet.show(
      context,
      title: "Room Type",
      options: Constants.roomTypes,
      selected: manager.state.roomType,
    );

    if (roomType != null) {
      manager.setRoomType(roomType);
    }
  }
}

part of '../home_screen.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<HomeManager>(context, listen: false);

    return StreamBuilder(
      stream: manager.stream,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state == null) {
          return const SizedBox();
        }

        final isLoading = state.status == StateStatus.loading;

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size.fromHeight(44),
          ),
          onPressed: () {
            if (!state.isInputValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Please fill all fields",
                  ),
                ),
              );
              return;
            }

            manager.submitImage();
          },
          child: !isLoading
              ? const Text("Generate")
              : const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

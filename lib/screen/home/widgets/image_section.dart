part of '../home_screen.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<HomeManager>(context, listen: false);

    return Column(
      children: [
        StreamBuilder(
          stream: manager.image$,
          builder: (context, snapshot) {
            final image = snapshot.data;

            if (image?.picked == null) {
              return _buildImagePicker(
                context,
                onTap: () => openImagePicker(context),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 340,
                        ),
                        child: Image.file(
                          File(
                            image!.picked!.path,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: _buildActionButton(
                          context,
                          onTap: () => manager.clearImage(),
                          icon: Icons.delete_outline_rounded,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: _buildActionButton(
                          context,
                          onTap: () => openImagePicker(context),
                          icon: Icons.image_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                if (image.result.isNotEmpty)
                  TextButton.icon(
                    onPressed: () => manager.reset(),
                    icon: const Icon(Icons.refresh),
                    label: const Text("Start Over"),
                  )
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildImagePicker(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: DashedBorder.fromBorderSide(
            dashLength: 10,
            side: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        height: 280,
        width: 200,
        alignment: Alignment.center,
        child: Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
    EdgeInsetsGeometry? margin,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: margin ?? const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.6),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Future<void> openImagePicker(BuildContext context) async {
    final manager = Provider.of<HomeManager>(context, listen: false);

    await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            minWidth: double.maxFinite,
            maxHeight: 300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Image Source",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  manager.pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.image_outlined),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  manager.pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';


class NetworkImageUtil extends StatefulWidget {
  final String networkImage;
  const NetworkImageUtil({super.key, required this.networkImage});

  @override
  State<NetworkImageUtil> createState() => _NetworkImageUtilState();
}

class _NetworkImageUtilState extends State<NetworkImageUtil> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
                widget.networkImage,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        // color: Custom,
                        strokeWidth: 2,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              );
  }
}
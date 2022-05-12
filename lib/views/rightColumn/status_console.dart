import 'package:flutter/material.dart';

class StatusConsole extends StatefulWidget {
  const StatusConsole({Key? key}) : super(key: key);

  @override
  State<StatusConsole> createState() => _StatusConsoleState();
}

class _StatusConsoleState extends State<StatusConsole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10.0),
      height: 320,
      width: 400,
      child: const Text("""
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat vehicula lectus nec dapibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris id mauris vitae ligula consectetur ornare. Maecenas eget felis sagittis, volutpat massa sollicitudin, auctor ligula. In aliquam euismod lorem sed tristique. Sed viverra nisi quis sapien convallis, rhoncus egestas quam suscipit. Vestibulum dignissim vestibulum diam, sed egestas neque facilisis eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. In augue ex, aliquet vel suscipit sed, suscipit vitae orci. Ut tempor dolor eget diam sodales sagittis. Vivamus dictum, mi at ultricies commodo, mauris nisl molestie ligula, ut commodo arcu mauris at nulla.

Cras tincidunt diam vel augue venenatis, ac sagittis velit fringilla. Nunc a dapibus nisi. Nullam a neque pulvinar, varius ligula id, viverra diam. Nam volutpat ultrices justo nec sollicitudin. Praesent at leo sed ipsum maximus pulvinar vel sed nulla. Donec mauris metus, lobortis non ipsum eu, ultricies mattis magna. Nunc egestas, dolor id condimentum porttitor, tortor tellus efficitur velit, ac consectetur eros nunc vitae lacus. Proin suscipit, turpis sed semper pulvinar, enim nibh feugiat lorem, non egestas sapien risus quis erat. Proin at vehicula dui, ac cursus dolor.
""",
        textAlign: TextAlign.left,
        maxLines: 20,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
      ),
    );
  }
}
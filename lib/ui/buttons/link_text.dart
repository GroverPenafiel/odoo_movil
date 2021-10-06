import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function? onPressed;
  final Color color;

  const LinkText(
      {Key? key,
      required this.text,
      this.color = Colors.white54,
      this.onPressed})
      : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(widget.text,
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: widget.color,
                  decoration: isHover
                      ? TextDecoration.underline
                      : TextDecoration.none)),
        ),
      ),
    );
  }
}

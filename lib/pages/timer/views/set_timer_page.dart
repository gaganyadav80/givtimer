import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class SetTimerPage extends StatelessWidget {
  const SetTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select the duration',
                  style: GoogleFonts.dmSerifDisplay(
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const VSpace(30),
                _SelectTimeWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: 'set-timer-button',
                  child: RoundedElevatedButton(
                    onPressed: () {},
                    icon: LineIcons.play,
                    label: 'Start',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 120,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: TextField(
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^(2[0-4]|1[0-9]|[1-9])$'),
                ),
              ],
              decoration: InputDecoration(
                hintText: 'h',
                hintStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
        ),
        ':'.text.headline2(context).make().pSymmetric(h: 5),
        Expanded(
          child: Container(
            height: 120,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: TextField(
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-5]?[0-9]$'),
                ),
              ],
              decoration: InputDecoration(
                hintText: 'm',
                hintStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
        ),
        ':'.text.headline2(context).make().pSymmetric(h: 5),
        Expanded(
          child: Container(
            height: 120,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: TextField(
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              // autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-5]?[0-9]$'),
                ),
              ],
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 's',
                hintStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/pages/home/home_page.dart';
import 'package:givtimer/theme.dart' show kPurpleColor;
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/src/modal_drag_handle.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class AddCustomActivityModal extends StatefulWidget {
  const AddCustomActivityModal({Key? key}) : super(key: key);

  @override
  State<AddCustomActivityModal> createState() => _AddCustomActivityModalState();
}

class _AddCustomActivityModalState extends State<AddCustomActivityModal> {
  String _name = '';
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: BuildModalChild(
        child: Padding(
          padding: kDefaultHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildModalDragHandle(),
              Text(
                'Add Custom Entry',
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
              const VSpace(10),
              const Text('Please provide the details.'),
              const VSpace(20),
              TopHeadAndActivityNameWidget(
                activityKeys: FireDBHelper().userActivityKeys,
                onTextChanged: (value) => _name = value,
                title: null,
                showDivider: false,
              ),
              const VSpace(20),
              TextField(
                controller: _durationController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: kBorderRadius,
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: kBorderRadius,
                    borderSide: const BorderSide(color: kPurpleColor),
                  ),
                  hintText: 'Duration (in mins)',
                  prefixIcon: const Icon(LineIcons.clock),
                ),
              ),
              // TODO(gagan): add date time picker
              const VSpace(30),
              BlueButton(
                title: 'Submit',
                height: 50,
                onPressed: () async {
                  if (_name.isEmpty) {
                    return showEmptyFieldDialog(
                      'Activity Name',
                      'Please enter activity name first.',
                    );
                  } else if (_durationController.text.isEmpty) {
                    return showEmptyFieldDialog(
                      'Duration',
                      'Please enter duration also.',
                    );
                  } else {
                    context.read<HomeCubit>().addCustomActivity(
                          _name,
                          int.parse(_durationController.text),
                        );
                  }

                  context.pop();
                  showBasicSnackBar(context, 'Activity added successfully.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showEmptyFieldDialog(String title, String desc) {
    return showCupertinoDialog<void>(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          content: Text(desc),
          title: Text(title),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}

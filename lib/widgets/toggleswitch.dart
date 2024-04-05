import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherwizard/utilities/themeprovider.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return   Switch(
                  value: Provider.of<Themeprovider>(context, listen: false)
                      .isdarkmode,
                  onChanged: (value) {
                    Provider.of<Themeprovider>(context, listen: false)
                        .toggleTheme();
                  },
                  thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                      (Set<MaterialState> states) {
                    final ThemeData theme = Theme.of(context);
                    final bool isDarkMode = theme.brightness == Brightness.dark;

                    if (isDarkMode) {
                      return const Icon(Icons.nightlight_round,
                          color: Colors.white);
                    } else {
                      return const Icon(Icons.wb_sunny, color: Colors.white);
                    }
                  }),
                )
;
  }
}
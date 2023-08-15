import 'package:chatgpt/config/theme/themedata.dart';
import 'package:chatgpt/data/repositories/theme_repository.dart';
import 'package:chatgpt/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeIconButton extends StatelessWidget {
  const ChangeThemeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeRepository themeRepository = ThemeRepository();

    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.nightlight_outlined
            : Icons.wb_sunny_outlined,
      ),
      onPressed: () {
        context.read<ThemeBloc>().add(ChangeTheme(
              themeRepository.loadTheme() ? lightTheme() : darkTheme(),
            ));
      },
    );
  }
}

import 'package:currenci_app/presentation/currency_bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/language.dart';
import 'language_item.dart';

class LanguageDialog extends StatefulWidget {
  final Function(Language language) onClick;

  const LanguageDialog({
    super.key,
    required this.onClick,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CurrencyBloc>().state;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            alignment: Alignment.center,
            height: 12,
            width: 56,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < Language.values.length; ++i)
            LanguageItem(
              isSelected: state.language == Language.values[i],
              language: Language.values[i].languageText,
              onClick: () {
                widget.onClick(Language.values[i]);
              },
            ),
        ],
      ),
    );
  }
}

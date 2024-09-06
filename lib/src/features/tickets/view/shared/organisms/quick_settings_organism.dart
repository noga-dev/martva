import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';

class QuickSettingsOrganism extends HookWidget {
  const QuickSettingsOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: DSSpacingTokens.m.allInsets,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _TranslationDropdownWidget(),
              const _LanguageDropdownWidget(),
              ListTile(
                title: const Text('Randomize answer order'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
              ListTile(
                title: const Text('Auto next on correct answer'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
              ListTile(
                title: const Text('Show explanation on correct answer'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
            ]
                .map((e) => Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _LanguageDropdownWidget extends ConsumerWidget {
  const _LanguageDropdownWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(localizationRepoProvider);
    final trans = ref.watch(ticketTranslationNotiferProvider);

    return ListTile(
      // titleAlignment: ListTileTitleAlignment.center,
      // leading: const Icon(Icons.language_sharp),
      title: SegmentedButton<SupportedLocale>(
        style: SegmentedButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.standard,
        ),
        showSelectedIcon: false,
        selected: {lang},
        segments: SupportedLocale.values.map((SupportedLocale locale) {
          return ButtonSegment(
            value: locale,
            label: Text(locale.name),
          );
        }).toList(),
        onSelectionChanged: (Set<SupportedLocale> newValue) {
          if (newValue.isNotEmpty) {
            if (newValue.first == SupportedLocale.ge &&
                trans == TicketTranslation.gpt4oMini) {
              Toaster.info(
                  r'''Georgian is the original, so there's no Martva translation. Switching to English.''');
              ref
                  .read(ticketTranslationNotiferProvider.notifier)
                  .update(TicketTranslation.original);
            }
            ref.read(localizationRepoProvider.notifier).update(newValue.first);
            // Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class _TranslationDropdownWidget extends HookConsumerWidget {
  const _TranslationDropdownWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trans = ref.watch(ticketTranslationNotiferProvider);
    final lang = ref.watch(localizationRepoProvider);

    return ListTile(
      // titleAlignment: ListTileTitleAlignment.center,
      // leading: const Icon(Icons.translate),
      title: SegmentedButton(
        style: SegmentedButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.standard,
        ),
        selected: {trans},
        showSelectedIcon: false,
        segments: TicketTranslation.values.map((TicketTranslation translation) {
          return ButtonSegment(
            value: translation,
            label: Text(translation.name),
          );
        }).toList(),
        onSelectionChanged: (Set<TicketTranslation> newValue) {
          if (newValue.isNotEmpty) {
            if (newValue.first == TicketTranslation.gpt4oMini &&
                lang == SupportedLocale.ge) {
              Toaster.info(
                  r'''There is no Georgian with Martva's translation. Switching to English.''');
              ref
                  .read(localizationRepoProvider.notifier)
                  .update(SupportedLocale.en);
            }
            ref
                .read(ticketTranslationNotiferProvider.notifier)
                .update(newValue.first);
            // Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/templates/shimmer.template.dart';
import 'package:martva/src/core/theme/view/tokens/ds_color_tokens.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/image_size.repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TicketImageMolecule extends ConsumerWidget {
  const TicketImageMolecule({
    super.key,
    required this.ticket,
  });

  final TicketDto ticket;

  @override
  Widget build(BuildContext context, ref) {
    final largeImages = ref.watch(imageSizeRepoProvider);

    final aspectRatio = largeImages.contains(ticket.ordinalId) ? 2.14 : 4.26;

    if (ticket.image.isEmpty) {
      return const SizedBox.shrink();
    }

    return ClipRect(
      clipper: const _BorderPixelClipper(2),
      child: CachedNetworkImage(
        cacheManager: DefaultCacheManager(),
        fadeInDuration: Duration.zero,
        placeholderFadeInDuration: Duration.zero,
        imageUrl: 'https://teoria.on.ge/files/new/${ticket.image}',
        imageBuilder: (context, imageProvider) => _Image(
          aspectRatio: aspectRatio,
          imageProvider: imageProvider,
          imageUrl: 'https://teoria.on.ge/files/new/${ticket.image}',
        ),
        placeholder: (context, url) => _Shimmer(aspectRatio: aspectRatio),
        errorWidget: (context, url, error) => CachedNetworkImage(
          cacheManager: DefaultCacheManager(),
          fadeInDuration: Duration.zero,
          placeholderFadeInDuration: Duration.zero,
          imageUrl: Supabase.instance.client.storage
              .from('ticket-images')
              .getPublicUrl(ticket.image),
          imageBuilder: (context, imageProvider) => _Image(
            aspectRatio: aspectRatio,
            imageProvider: imageProvider,
            imageUrl: Supabase.instance.client.storage
                .from('ticket-images')
                .getPublicUrl(ticket.image),
          ),
          placeholder: (context, url) => _Shimmer(aspectRatio: aspectRatio),
          errorWidget: (context, url, error) => const _Error(),
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.error),
      label: const Text('Error'),
      onPressed: null,
    );
  }
}

class _BorderPixelClipper extends CustomClipper<Rect> {
  const _BorderPixelClipper(this.px);

  final double px;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(px, px, size.width - px, size.height - px);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class _Image extends StatelessWidget {
  const _Image({
    required this.aspectRatio,
    required this.imageProvider,
    required this.imageUrl,
  });

  final double aspectRatio;
  final ImageProvider imageProvider;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: SizedBox(
        height: 200.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: const Alignment(0, -1),
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: ColorTokens.primary.withOpacity(0.2),
              onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => InteractiveViewer(
                  child: CachedNetworkImage(
                    cacheManager: DefaultCacheManager(),
                    imageUrl: imageUrl,
                  ),
                ),
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Shimmer extends StatelessWidget {
  const _Shimmer({
    required this.aspectRatio,
  });

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ShimmerTemplate(
      enabled: true,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: const SizedBox(
          height: 200,
          child: Card(
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

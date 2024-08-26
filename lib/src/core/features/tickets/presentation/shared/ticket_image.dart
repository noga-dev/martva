import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/features/tickets/repos/image_size.repo.dart';
import 'package:martva/src/models/ticket.dto.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TicketImage extends ConsumerWidget {
  const TicketImage({
    super.key,
    required this.ticket,
  });

  final TicketDto ticket;

  @override
  Widget build(BuildContext context, ref) {
    final largeImages = ref.watch(imageSizeRepoProvider).valueOrNull ?? [];

    final aspectRatio = largeImages.contains(ticket.id) ? 2.14 : 4.26;

    return ClipRect(
      clipper: const _BorderPixelClipper(2),
      child: CachedNetworkImage(
        imageUrl: 'https://teoria.on.ge/files/new/$ticket',
        imageBuilder: (context, imageProvider) => _Image(
          aspectRatio: aspectRatio,
          image: imageProvider,
        ),
        placeholder: (context, url) => _Shimmer(aspectRatio: aspectRatio),
        errorWidget: (context, url, error) => CachedNetworkImage(
          imageUrl: Supabase.instance.client.storage
              .from('ticket-images')
              .getPublicUrl(ticket.image),
          imageBuilder: (context, imageProvider) => _Image(
            aspectRatio: aspectRatio,
            image: imageProvider,
          ),
          placeholder: (context, url) => _Shimmer(aspectRatio: aspectRatio),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
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
    required this.image,
  });

  final double aspectRatio;
  final ImageProvider image;

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
              image: image,
              fit: BoxFit.cover,
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
    return Skeletonizer(
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

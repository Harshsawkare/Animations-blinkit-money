import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/datasources/wallet_local_data_source.dart';
import '../../data/repositories/wallet_repository_impl.dart';
import '../../domain/entities/wallet_feature_entity.dart';
import '../../domain/usecases/get_wallet_features_usecase.dart';
import '../painters/background_dots_painter.dart';
import '../widgets/feature_card_widget.dart';
import '../widgets/add_money_button_widget.dart';
import '../widgets/claim_gift_card_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  late final List<WalletFeatureEntity> _features;

  // Controls phases 1-4: wallet center → texts appear → 1s hold → group moves up.
  late final AnimationController _introController;

  // Controls phase 5: content items appear one by one after the group settles.
  late final AnimationController _contentController;

  late final Animation<double> _blinkitAnim;
  late final Animation<double> _moneyAnim;
  late final Animation<double> _groupMoveAnim;
  late final List<Animation<double>> _contentAnims;

  late final AnimationController _lottieController;
  bool _introComplete = false;

  // cards + AddMoneyButton + ClaimGiftCard + WatermarkText
  int get _contentItemCount => _features.length + 3;

  @override
  void initState() {
    super.initState();

    final dataSource = const WalletLocalDataSourceImpl();
    final repository = WalletRepositoryImpl(dataSource);
    final useCase = GetWalletFeaturesUseCase(repository);
    _features = useCase();

    // ── Intro controller ──────────────────────────────────────────────────
    // Timeline (ms):
    //   0    – 3000 : wallet centered, everything else invisible
    //   3000 – 3300 : 'blinkit' slides up & fades in
    //   3350 – 3650 : 'MONEY'   slides up & fades in
    //   3650 – 4650 : 1-second hold
    //   4700 – 5200 : group translates to final top position
    const int introMs = 5200;
    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: introMs),
    );

    _blinkitAnim = CurvedAnimation(
      parent: _introController,
      curve: const Interval(3000 / introMs, 3300 / introMs, curve: Curves.easeOut),
    );

    _moneyAnim = CurvedAnimation(
      parent: _introController,
      curve: const Interval(3350 / introMs, 3650 / introMs, curve: Curves.easeOut),
    );

    _groupMoveAnim = CurvedAnimation(
      parent: _introController,
      curve: const Interval(4700 / introMs, 1.0, curve: Curves.easeInOut),
    );

    // ── Content controller ────────────────────────────────────────────────
    // Each item animates over 350ms, staggered by 250ms.
    const int itemDurationMs = 350;
    const int itemStaggerMs = 250;
    final int contentTotalMs =
        (_contentItemCount - 1) * itemStaggerMs + itemDurationMs;

    _contentController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: contentTotalMs),
    );

    _contentAnims = List.generate(_contentItemCount, (i) {
      final double start = (i * itemStaggerMs) / contentTotalMs;
      final double end = (i * itemStaggerMs + itemDurationMs) / contentTotalMs;
      return CurvedAnimation(
        parent: _contentController,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _lottieController = AnimationController(vsync: this);

    _introController.forward().then((_) {
      if (!mounted) return;
      setState(() => _introComplete = true);
      _contentController.forward();
    });
  }

  @override
  void dispose() {
    _introController.dispose();
    _contentController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Vertical space available inside SafeArea.
    final double availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    // Top padding needed so the wallet's centre aligns with the screen centre.
    // wallet centre from column top = spacingL + walletSize / 2
    final double walletCentreInColumn =
        AppConstants.spacingL + AppConstants.walletIllustrationSize / 2;
    final double centerOffset =
        (availableHeight / 2 - walletCentreInColumn).clamp(0.0, double.infinity);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // ── Background gradient ──────────────────────────────────────
            Positioned.fill(
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.walletGoldDark,
                      AppColors.iconBackground,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.32],
                  ),
                ),
              ),
            ),

            // ── Dot-grid background texture ──────────────────────────────
            Align(
              alignment: const Alignment(0, -1.4),
              child: Transform.rotate(
                angle: 45 * 3.14 / 120,
                child: SizedBox(
                  width: mediaQuery.size.width,
                  height: 520,
                  child: CustomPaint(painter: const BackgroundDotsPainter()),
                ),
              ),
            ),

            // ── Animated main content ────────────────────────────────────
            SafeArea(
              child: AnimatedBuilder(
                animation: Listenable.merge([_introController, _contentController]),
                builder: (context, _) {
                  // Shrinks from centerOffset → 0 as the group moves to its
                  // final position during phase 4.
                  final double topOffset =
                      centerOffset * (1.0 - _groupMoveAnim.value);

                  return SingleChildScrollView(
                    physics: _introComplete
                        ? const BouncingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: topOffset),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: AppConstants.spacingL),

                          // ── Wallet illustration (always visible) ─────────
                          SizedBox(
                            width: AppConstants.walletIllustrationSize,
                            height: AppConstants.walletIllustrationSize,
                            child: Image.asset('assets/wallet.png'),
                          ),

                          const SizedBox(height: AppConstants.spacingM),

                          // ── Brand name: 'blinkit' slides in first ────────
                          _SlideInWidget(
                            animation: _blinkitAnim,
                            child: const Text(
                              'blinkit',
                              style: AppTextStyles.brandName,
                            ),
                          ),

                          // ── Brand title: 'MONEY' slides in second ────────
                          _SlideInWidget(
                            animation: _moneyAnim,
                            child: const Text(
                              'MONEY',
                              style: AppTextStyles.brandTitle,
                            ),
                          ),

                          const SizedBox(height: AppConstants.spacingXL),

                          // ── Feature highlight cards ──────────────────────
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.screenHorizontalPadding,
                            ),
                            child: Column(
                              children: [
                                for (int i = 0; i < _features.length; i++) ...[
                                  _SlideInWidget(
                                    animation: _contentAnims[i],
                                    child: FeatureCardWidget(
                                      feature: _features[i],
                                    ),
                                  ),
                                  if (i < _features.length - 1)
                                    const SizedBox(height: AppConstants.spacingS),
                                ],
                              ],
                            ),
                          ),

                          const SizedBox(height: AppConstants.spacingL),

                          // ── Add Money CTA ────────────────────────────────
                          _SlideInWidget(
                            animation: _contentAnims[_features.length],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.screenHorizontalPadding,
                              ),
                              child: AddMoneyButtonWidget(onTap: () {}),
                            ),
                          ),

                          const SizedBox(height: AppConstants.spacingL),

                          // ── Claim gift card row ──────────────────────────
                          _SlideInWidget(
                            animation: _contentAnims[_features.length + 1],
                            child: ClaimGiftCardWidget(onTap: () {}),
                          ),

                          const SizedBox(height: AppConstants.spacingL),

                          // ── Watermark text ───────────────────────────────
                          _SlideInWidget(
                            animation: _contentAnims[_features.length + 2],
                            child: _WatermarkText(),
                          ),

                          const SizedBox(height: AppConstants.spacingXL),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ── Confetti Lottie (rendered above all content, non-interactive) ──
            IgnorePointer(
              child: Lottie.asset(
                'assets/confetti.json',
                controller: _lottieController,
                onLoaded: (composition) {
                  _lottieController
                    ..duration = composition.duration
                    ..forward();
                },
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fades in and translates up from 30px below its final position.
class _SlideInWidget extends StatelessWidget {
  const _SlideInWidget({
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, 30 * (1 - animation.value)),
          child: child,
        ),
        child: child,
      ),
    );
  }
}

class _WatermarkText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.screenHorizontalPadding,
      ),
      child: Text(
        'Enjoy seamless\none tap payments',
        style: AppTextStyles.watermark,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:e_election/app/theme/app_assets.dart';
import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/ui/features/candidate/cubit/candidate_cubit.dart';
import 'package:e_election/ui/features/candidate_details/candidate_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CandidateBody extends StatefulWidget {
  const CandidateBody({super.key});

  @override
  State<CandidateBody> createState() => _CandidateBodyState();
}

class _CandidateBodyState extends State<CandidateBody> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await context.read<CandidateCubit>().refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return BlocBuilder<CandidateCubit, CandidateState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: _loadData,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _buildProfileHeader(state, isArabic),
                        const SizedBox(height: 24),
                        _buildElectionCard(context, isArabic),
                        const SizedBox(height: 32),
                        _buildSectionHeader(isArabic),
                      ]),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    sliver: _buildCandidatesGrid(state, isArabic),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(bool isArabic) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isArabic ? LocaleKeys.all_elected.tr() : LocaleKeys.all_elected.tr(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text(
            isArabic ? LocaleKeys.see_all.tr() : LocaleKeys.see_all.tr(),
          ),
          icon: Icon(
            isArabic ? Icons.arrow_forward : Icons.arrow_back,
            size: 18,
          ),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF6C63FF),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(CandidateState state, bool isArabic) {
    if (state is CandidateDataState && state.profile != null) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Hero(
              tag: 'profile_avatar',
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF6C63FF),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    state.profile!.data.avatar,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: isArabic
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.welcome_back.tr(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isArabic
                        ? '${state.profile!.data.firstName} ${state.profile!.data.middleName} ${state.profile!.data.lastName}'
                        : '${state.profile!.data.firstName} ${state.profile!.data.middleName} ${state.profile!.data.lastName}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                      fontFamily: 'Cairo', // Add Arabic font support
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // textDirection:
                    //     isArabic ? TextDirection.rtl : TextDirection.ltr,
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Show shimmer loading when profile is loading
    if (state is CandidateDataState && state.isLoadingProfile) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: isArabic
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildElectionCard(BuildContext context, bool isArabic) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF5449FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: isArabic ? null : -20,
            left: isArabic ? -20 : null,
            top: -20,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:
                  isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.sudan_elections.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  LocaleKeys.days_remaining.tr(args: ['20']),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6C63FF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    LocaleKeys.vote_now.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCandidatesGrid(CandidateState state, bool isArabic) {
    return switch (state) {
      CandidateInitial() || CandidateLoading() => SliverLayoutBuilder(
          builder: (BuildContext context, SliverConstraints constraints) {
            final double screenWidth = constraints.crossAxisExtent;
            int crossAxisCount;
            double childAspectRatio;
            double padding;

            if (screenWidth < 600) {
              crossAxisCount = 2;
              childAspectRatio = 0.75;
              padding = 16.0;
            } else if (screenWidth < 900) {
              crossAxisCount = 3;
              childAspectRatio = 0.8;
              padding = 24.0;
            } else {
              crossAxisCount = 4;
              childAspectRatio = 0.85;
              padding = 32.0;
            }

            return SliverPadding(
              padding: EdgeInsets.all(padding),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  mainAxisSpacing: padding,
                  crossAxisSpacing: padding,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(padding / 1.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 16,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 12,
                                      width: double.infinity * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 10,
                                      width: double.infinity * 0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 6, // Show 6 shimmer items while loading
                ),
              ),
            );
          },
        ),
      CandidateError() => SliverToBoxAdapter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _loadData(),
                  child: Text(LocaleKeys.try_again.tr()),
                ),
              ],
            ),
          ),
        ),
      CandidateDataState()
          when state.candidates?.data == null ||
              state.candidates!.data.isEmpty =>
        SliverToBoxAdapter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_off, size: 48, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(LocaleKeys.no_candidates.tr()),
              ],
            ),
          ),
        ),
      CandidateDataState() => SliverLayoutBuilder(
          builder: (BuildContext context, SliverConstraints constraints) {
            // Calculate number of columns based on screen width
            final double screenWidth = constraints.crossAxisExtent;
            int crossAxisCount;
            double childAspectRatio;
            double padding;

            if (screenWidth < 600) {
              // Mobile
              crossAxisCount = 2;
              childAspectRatio = 0.75;
              padding = 16.0;
            } else if (screenWidth < 900) {
              // Tablet
              crossAxisCount = 3;
              childAspectRatio = 0.8;
              padding = 24.0;
            } else {
              // Desktop
              crossAxisCount = 4;
              childAspectRatio = 0.85;
              padding = 32.0;
            }

            return SliverPadding(
              padding: EdgeInsets.all(padding),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  mainAxisSpacing: padding,
                  crossAxisSpacing: padding,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final candidate = state.candidates!.data[index];
                    return GestureDetector(
                      onTap: () => context.pushNamed(
                        CandidateDetailsScreen.routeName,
                        extra: candidate,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                  ),
                                  child: Image.network(
                                    candidate.logo ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.person, size: 64),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(padding / 1.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${candidate.citizen.firstName} ${candidate.citizen.lastName}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth < 600 ? 14 : 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      candidate.citizen.party?.name ?? '',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: screenWidth < 600 ? 12 : 14,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: state.candidates?.data.length ?? 0,
                ),
              ),
            );
          },
        ),
      _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
    };
  }
}

class CandidateGridItem extends StatelessWidget {
  final String name;
  final String party;
  final String imageUrl;
  final Candidate candidate;
  final bool isArabic;

  const CandidateGridItem({
    super.key,
    required this.name,
    required this.party,
    required this.imageUrl,
    required this.candidate,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        CandidateDetailsScreen.routeName,
        extra: candidate,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Hero(
                tag: 'candidate_$imageUrl',
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF6C63FF),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: isArabic
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1A1A1A),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      party,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                isArabic ? Icons.chevron_left : Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

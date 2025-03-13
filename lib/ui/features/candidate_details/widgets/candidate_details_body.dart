import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/ui/features/candidate_details/cubit/candidate_details_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class CandidateDetailsBody extends StatefulWidget {
  final Candidate candidate;
  const CandidateDetailsBody({super.key, required this.candidate});

  @override
  State<CandidateDetailsBody> createState() => _CandidateDetailsBodyState();
}

class _CandidateDetailsBodyState extends State<CandidateDetailsBody> {
  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 1024;

    return BlocProvider(
      create: (context) => CandidateDetailsCubit(),
      child: BlocConsumer<CandidateDetailsCubit, CandidateDetailsState>(
        listener: (context, state) {
          if (state is CandidatevoteLoaded) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const SuccessVoteDialog();
              },
            );
          }
          if (state is CandidatevoteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  // App Bar
                  Padding(
                    padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                    child: Row(
                      // textDirection:
                      //     isArabic ? TextDirection.rtl : TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(isArabic
                              ? Icons.arrow_forward
                              : Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          LocaleKeys.candidate_details.tr(),
                          style: TextStyle(
                            fontSize: isDesktop ? 24 : 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansArabic',
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF6C63FF),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.share, color: Colors.white),
                            onPressed: () {
                              // Add share functionality
                              Share.share(
                                '${LocaleKeys.share_candidate_description.tr(args: [
                                      widget.candidate.citizen.firstName
                                    ])}',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                        child: Column(
                          crossAxisAlignment: isArabic
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            // Profile Section
                            Center(
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'candidate_${widget.candidate.id}',
                                    child: CircleAvatar(
                                      radius: isDesktop
                                          ? 70
                                          : isTablet
                                              ? 60
                                              : 50,
                                      backgroundImage: NetworkImage(
                                        widget.candidate.logo,
                                      ),
                                      onBackgroundImageError: (_, __) {},
                                      child: widget.candidate.logo.isEmpty
                                          ? const Icon(Icons.person)
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    isArabic
                                        ? '${widget.candidate.citizen.firstName} ${widget.candidate.citizen.lastName}'
                                        : '${widget.candidate.citizen.firstName} ${widget.candidate.citizen.lastName}',
                                    style: TextStyle(
                                      fontSize: isDesktop ? 28 : 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSansArabic',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.candidate.citizen.party?.name ?? '',
                                    style: TextStyle(
                                      fontSize: isDesktop ? 18 : 16,
                                      color: Colors.grey,
                                      fontFamily: 'NotoSansArabic',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Election Info
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: isArabic
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.candidate_info.tr(),
                                    style: TextStyle(
                                      fontSize: isDesktop ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSansArabic',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildInfoRow(
                                    LocaleKeys.election_year.tr(),
                                    widget.candidate.election.year,
                                    isArabic,
                                  ),
                                  _buildInfoRow(
                                    LocaleKeys.start_date.tr(),
                                    widget.candidate.election.startedAt,
                                    isArabic,
                                  ),
                                  _buildInfoRow(
                                    LocaleKeys.end_date.tr(),
                                    widget.candidate.election.endedAt,
                                    isArabic,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Biography
                            Text(
                              LocaleKeys.biography.tr(),
                              style: TextStyle(
                                fontSize: isDesktop ? 22 : 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansArabic',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.candidate.details,
                              style: TextStyle(
                                fontSize: isDesktop ? 16 : 14,
                                height: 1.5,
                                fontFamily: 'NotoSansArabic',
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Social Links
                            Text(
                              LocaleKeys.social_links.tr(),
                              style: TextStyle(
                                fontSize: isDesktop ? 22 : 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansArabic',
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildSocialLinks(isArabic, isDesktop),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Vote Button
                  Padding(
                    padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                    child: ElevatedButton(
                      onPressed: state is CandidatevoteLoading
                          ? null
                          : () {
                              context
                                  .read<CandidateDetailsCubit>()
                                  .vote(widget.candidate.id.toString());
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        minimumSize: Size(double.infinity, isDesktop ? 64 : 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: state is CandidatevoteLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              '${LocaleKeys.vote_for.tr()} ${widget.candidate.citizen.firstName} ${widget.candidate.citizen.lastName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isDesktop ? 20 : 18,
                                fontFamily: 'NotoSansArabic',
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isArabic) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'NotoSansArabic',
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansArabic',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks(bool isArabic, bool isDesktop) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      runSpacing: 16,
      // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      children: [
        _buildSocialLink(
          'Facebook',
          Icons.facebook,
          Colors.blue,
          widget.candidate.facebookUrl,
          isDesktop,
        ),
        _buildSocialLink(
          'Wikipedia',
          Icons.article,
          Colors.grey,
          widget.candidate.wikipediaUrl,
          isDesktop,
        ),
        _buildSocialLink(
          'Youtube',
          Icons.play_circle,
          Colors.red,
          widget.candidate.youtubeUrl,
          isDesktop,
        ),
        _buildSocialLink(
          'X',
          Icons.alternate_email,
          Colors.black,
          widget.candidate.xUrl,
          isDesktop,
        ),
      ],
    );
  }

  Widget _buildSocialLink(
    String platform,
    IconData icon,
    Color color,
    String url,
    bool isDesktop,
  ) {
    return InkWell(
      onTap: () {
        // Add URL launcher functionality
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: isDesktop ? 24 : 20),
            const SizedBox(width: 8),
            Text(
              platform,
              style: TextStyle(
                color: color,
                fontSize: isDesktop ? 16 : 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessVoteDialog extends StatelessWidget {
  const SuccessVoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color(0xFF6C63FF),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),

            // Success Message
            Text(
              LocaleKeys.vote_success.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              LocaleKeys.vote_success_description.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Close Button
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(120, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: Text(
                LocaleKeys.close.tr(),
                style: const TextStyle(
                  color: Color(0xFF6C63FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

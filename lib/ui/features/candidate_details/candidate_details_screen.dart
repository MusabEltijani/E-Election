import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/ui/features/candidate_details/widgets/candidate_details_body.dart';
import 'package:flutter/material.dart';

class CandidateDetailsScreen extends StatelessWidget {
  static const routeName = 'candidate-details';
  final Candidate candidate;

  const CandidateDetailsScreen({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CandidateDetailsBody(candidate: candidate),
    );
  }
}

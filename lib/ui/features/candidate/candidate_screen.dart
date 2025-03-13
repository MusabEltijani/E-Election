import 'package:e_election/ui/features/candidate/cubit/candidate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/candidate_body.dart';

class CandidateScreen extends StatelessWidget {
  static const routeName = '/candidateScreen';
  const CandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateCubit(),
      child: const CandidateBody(),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janadem/core/shared_provider/shared_providers.dart';
import 'package:janadem/models/issue/issues_state/issues_state.dart';
import 'package:janadem/requests/appRepository/issue/issues_repository.dart';
import 'package:janadem/requests/appRequestsApi/issue/issues_request_api.dart';

final issuesApiProvider = Provider<IssuesRequestApi>((ref) {
  return IssuesRequestApi(ref.read(dioClientProvider));
});

final issuesRepositoryProvider = Provider<IssuesRepository>((ref) {
  return IssuesRepository(ref.read(issuesApiProvider));
});

final issuesDataProvider =
StateNotifierProvider.autoDispose<IssuesDataNotifier, IssuesState>((ref) {
  return IssuesDataNotifier(ref.read(issuesRepositoryProvider));
});


class IssuesDataNotifier extends StateNotifier<IssuesState> {
  IssuesDataNotifier(this.issuesRepository) : super(IssuesState()) {
    getIssues();
  }
  IssuesRepository issuesRepository;

  Future<void> getIssues() async {
    state = state.copyWith(isLoading: true);
    await issuesRepository.fetchIssueList().then((data) {
      state = state.copyWith(issues: data, isLoading: false);
    });
  }}
part of 'get_user_cubit.dart';

enum Status { initial, loading, loaded, error }

class GetUserState extends Equatable {
  const GetUserState({required this.status, this.user});

  final UserModel? user;
  final Status status;

  @override
  List<Object?> get props => [status, user];
}

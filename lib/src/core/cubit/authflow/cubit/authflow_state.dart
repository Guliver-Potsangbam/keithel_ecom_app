part of 'authflow_cubit.dart';

enum Status { initial, login, logout }

class AuthflowState extends Equatable {
  const AuthflowState({required this.status});
  final Status status;

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

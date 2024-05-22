part of 'auth_bloc.dart';

enum AuthStateStatus { initial, success, error, loading }

extension AuthStateStatusX on AuthStateStatus {
  bool get isInitial => this == AuthStateStatus.initial;
  bool get isSuccess => this == AuthStateStatus.success;
  bool get isError => this == AuthStateStatus.error;
  bool get isLoading => this == AuthStateStatus.loading;
}

class AuthState extends Equatable {
  const AuthState(
      {this.username,
      this.password,
      this.status = AuthStateStatus.initial,
      this.message,
      this.id_pelabuhan,
      this.nama});

  final String? username;
  final String? password;
  final AuthStateStatus status;
  final String? message;
  final String? id_pelabuhan;
  final String? nama;

  @override
  List<Object?> get props =>
      [username, password, status, message, id_pelabuhan, nama];

  AuthState copyWith({
    final String? username,
    final String? password,
    final AuthStateStatus? status,
    final String? message,
    final String? id_pelabuhan,
    final String? nama,
  }) {
    return AuthState(
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status,
        message: message ?? this.message,
        id_pelabuhan: id_pelabuhan ?? this.id_pelabuhan,
        nama: id_pelabuhan ?? this.nama);
  }
}

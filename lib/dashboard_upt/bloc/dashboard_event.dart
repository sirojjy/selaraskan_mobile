part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class OnDashboardEvent extends DashboardEvent {
  const OnDashboardEvent();
}

class OnDashboardMenuChanged extends DashboardEvent {
  final int index;

  OnDashboardMenuChanged(this.index);
}

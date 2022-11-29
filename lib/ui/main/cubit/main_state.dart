import 'package:equatable/equatable.dart';

enum MainStatus{ initial }

class MainState extends Equatable {
  const MainState({
    this.status = MainStatus.initial,
    this.currentNavigationItem = 1,
  });

  final MainStatus status;
  final int currentNavigationItem;

  MainState copyWith({
    MainStatus? status,
    int? currentNavigationItem,
  }) {
    return MainState(
      status: status ?? this.status,
      currentNavigationItem: currentNavigationItem ?? this.currentNavigationItem,
    );
  }

  @override
  List<Object> get props => [currentNavigationItem, status];
}
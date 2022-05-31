part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(this.homeIdx);

  final int homeIdx;

  @override
  List<Object> get props => [homeIdx];
}

part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({this.menuToRight = false});

  final bool menuToRight;

  @override
  List<Object> get props => [menuToRight];

  SettingsState copyWith({
    bool? menuToRight,
  }) {
    return SettingsState(
      menuToRight: menuToRight ?? this.menuToRight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'menuToRight': menuToRight,
    };
  }

  // ignore: sort_constructors_first
  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      menuToRight: (map['menuToRight'] ?? false) as bool,
    );
  }
}

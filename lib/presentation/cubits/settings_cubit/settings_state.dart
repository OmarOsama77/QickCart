part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class PickImageState extends SettingsState{}

class UserDataChanged extends SettingsState{}

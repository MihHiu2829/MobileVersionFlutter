import 'package:equatable/equatable.dart';

abstract class SettingEvent  extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnMyProfile extends SettingEvent{}
class OnShowCurrentResult extends SettingEvent{}
class OnLogOut extends SettingEvent{}
class OnCustomize extends SettingEvent{}
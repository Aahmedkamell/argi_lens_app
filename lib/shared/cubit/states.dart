abstract class AppStates{}

class AppInitialStates extends AppStates{}

class AppBottomNavState extends AppStates{}

class AppProfileOpenedState extends AppStates{}

class TimerResetState extends AppStates{}

class TimerSavedState extends AppStates{}

class AppUpdateTimeState extends AppStates{}

class AppHealthUpdatedState extends AppStates{}

class BottomSheetShownState extends AppStates{}

class ButtonChangeState extends AppStates{}
class ButtonResetState extends AppStates{}
class AppChangeFilterState extends AppStates{}
class DateRangeUpdatedState extends AppStates{}
class DateRangeClearedState extends AppStates{}

class FarmLoading extends AppStates {}

class FarmDataUpdated extends AppStates {}

class FarmLoaded extends AppStates {
  final Map<String, dynamic> farmData;
  FarmLoaded(this.farmData);
}

class FarmError extends AppStates {
  final String message;
  FarmError(this.message);
}






import 'package:todo_api/gen/assets.gen.dart';

class OnboardingModel {
  String? backGround;
  String? image;
  String? title;
  String? subTitle;
  OnboardingModel();
}

List<OnboardingModel> listOnboardingModel = [
  OnboardingModel()
    ..backGround = Assets.images.brOnboarding1.path
    ..image = Assets.images.onboarding1.path
    ..title = 'Organize Your Tasks'
    ..subTitle =
        'Keep your tasks organized by category, priority, or due date.',
  OnboardingModel()
    ..backGround = Assets.images.brOnboarding2.path
    ..image = Assets.images.onboarding2.path
    ..title = 'Collaborate With Others'
    ..subTitle =
        'Invite friends or colleagues to collaborate on tasks and projects.Make yourself Productive. ',
  OnboardingModel()
    ..backGround = Assets.images.brOnboarding3.path
    ..image = Assets.images.onboarding3.path
    ..title = 'Organize Your Tasks'
    ..subTitle =
        'You\'re ready to start using \"PlanIt\" to manage your tasks and stay organized.'
];

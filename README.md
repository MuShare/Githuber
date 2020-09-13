# Githuber

This demo app relies on the following libraries

- RxSwift (https://github.com/ReactiveX/RxSwift)
- RxCocoa (https://github.com/ReactiveX/RxSwift)
- RxFlow (https://github.com/RxSwiftCommunity/RxFlow)
- RxController(https://github.com/RxSwiftCommunity/RxController)

## About Architecture

This demo app is based on RxController, which makes it easier to build a MVVM-C application.
Storyboard or xib files are not recommended to be used within this demo, because the basic class `RxViewController` aims at removing all `IUO` properties to avoid crash.
To build UI, `SnapKit` is used within this demo.

MVVM and RxSwift are recommended to be used within view controller and view model classes.
For customized cells and views, the simple MVC design pattern is recommended.

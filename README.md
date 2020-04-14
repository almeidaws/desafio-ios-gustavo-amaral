# Marvel's Heroes
[![Build Status](https://travis-ci.org/almeidaws/desafio-ios-gustavo-amaral.svg?branch=master)](https://travis-ci.org/almeidaws/desafio-ios-gustavo-amaral)

![App's preview](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Preview.gif)

*Marvel's Heroes* is an iOS, iPad and MacOS application that consumes data from [Marvel's API](https://developer.marvel.com/) and presents the characters, allowing the user view its details and the most expensive comic in which that character appears.

It was created with the latest Apple's technologies like [SwiftUI](https://developer.apple.com/xcode/swiftui/) and [Combine](https://developer.apple.com/documentation/combine). For that reason, the app hasn't any [View Controllers](https://developer.apple.com/documentation/uikit/view_controllers). Instead, it is gracefully composed of a hierarchy of [View](https://developer.apple.com/documentation/swiftui/view) protocols. Furthermore, it is completely reactive instead of event-driven like apps created with [UIKit](https://developer.apple.com/documentation/uikit).

## App's architecture

[MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controll.pnger), [MVVM](https://www.objc.io/issues/13-architecture/mvvm/), [Viper](https://www.objc.io/issues/13-architecture/viper/) and the its variations are all architectures created with UIKit in mind. Just [replicating those architectures for SwiftUI-based apps is not a smart decision](https://nalexn.github.io/clean-architecture-swiftui/).

Views from SwiftUI are like functions that return a screen based the data given to it. It is functional. Considering those facts, there is a new way to implement [MVVM](https://nalexn.github.io/clean-architecture-swiftui/) and another new one called [Composable](https://www.pointfree.co/collections/composable-architecture).

For this app, MVVM was choosed for some reasons:

1. It is not [opinionated](https://stackoverflow.com/a/802064/8869936).
2. It fits well the idea of handling any necessary logic and delivering to the UI data ready to be presented.
3.  It has enough [testability](https://en.wikipedia.org/wiki/Software_testability) for this project.
4. It is easy to understand.


## Dark Mode, iPad, MacOS, portrait and landscape versions

One of the huge benefits of using SwiftUI is that the same UI code can be used for three different platforms. And because of that, the app works for *iPhone, iPad and MacOS*, on *different screens* sizes and on both *landscape and portrait* mode. Furthermore, it also has both *light and dark mode* version. 

![Presentation iPhones](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Presentation%20iPhones.png)
![Presentation iPads](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Presentation%20iPads.png)

## Continuous Integration

Continuous integration was configured using [Travis CI](https://travis-ci.org/). The current build status is

[![Build Status](https://travis-ci.org/almeidaws/desafio-ios-gustavo-amaral.svg?branch=master)](https://travis-ci.org/almeidaws/desafio-ios-gustavo-amaral)

(Click on it)
 
## Unit Tests And Snapshot Tests

Currently, there are 32 tests on the app:

- 24 of them testing the user interface on different devices and orientations both on light and dark mode.
- 8 testing the Networking module used to abstract how data is retrieved from the Marvel's API.

**Snapshots images generated on UI Tests**

![Snapshots form UI tests](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Snapshots.png)

**All tests were executed successfully**

![Successfully executed tests](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Successful%20tests.png)



The data is correctly mocked using [Dependency Injection](https://en.wikipedia.org/wiki/Dependency_injection), so no internet connection is made during the tests, ensuring that, if one of them fails, it is because there is some error on the code not because connection problems.

## The new Swift Package Manager instead of CocoaPods or Carthage

Recreating already existent code may be expensive in time and cost, so [Swift Package Manager](https://swift.org/package-manager/) was choosed as the dependency manager to install [Alamofire](https://github.com/Alamofire/Alamofire), [AlamofireImage](https://github.com/Alamofire/AlamofireImage) and [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing) frameworks. 

CocoaPods and Carthage could be a choice, but the new SPM is completely integrated with Xcode decreasing the number of problems related to dependency installing, making the work more productive.

## Networking module

Working on large projects require it to broken into smaller interconnected parts. It was done using the system of Workspaces from Xcode. There are two project on the workspace:

- **MarvelHeroes** used to mainly to handle the screens. 

- **Networking**, created, as the name tells us, to abstract how networking is handled by the app. It exposes only the necessary methods that return instances that conforms to [Publisher](https://developer.apple.com/documentation/combine/publisher), making it easy to be connected with SwiftUI.

**The project's structure follows [Separation of Concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) design principle**

![Project's file structure](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/File%20Structure.png)

## Principles of Scrum

The project was created by just one person in 4 days, but that is not an argument to completely avoid using [Scrum](https://www.scrum.org/).

A backlog was created to track all the requirements and polishments that could be made, even that most worthless ones. It was important to view the big picture when finishing some feature and starting others.

**This board is public. It is [available on Trello](https://trello.com/b/SddlKA6b/marvels-heroes)**
![Project's file structure](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Trello.png)

## Protocol-oriented Value-oriented programming


Apple has released Swift in 2014, and the language has evolved introducing some paradigms. Besides Object-oriented Programming, Swift is a protocol-oriented language. But the problem is that UIKit is object-oriented. So it is sometimes difficult to mix both paradigms.

The good news is that Protocol-oriented and Value-oriented paradigms fits perfectly with SwiftUI and Combine, so it is much more easy to created high quality code decreasing the number of errors and increasing the maintainability.

**Example of the advanced technique [Type Erasure](https://medium.com/@chris_dus/type-erasure-in-swift-84480c807534) used to implement Dependency Injection to test views.**
![Example of Type Erasing](https://github.com/almeidaws/desafio-ios-gustavo-amaral/blob/master/Doc/Type%20Erasure.png)


## Git Flow and Versioning with Git

It is import to keep unstable code away from the client. To do so, some branches like `screens`, `networking` and `uitests` were created in those 4 days. Actually, the `master` branch was almost the last one to be created. On a large team it would be needed to create branches of branches of branches. But doing that for this project would be an unnecessary overkill.

## Project Configuration

The project has only two parameters extracted to entries in *Info.plist* file. 

- `MARVEL_API_KEY` is the key from the Marvel's API.
- `MARVEL_HOST_URL` is the base URL used to make requests. Currently it is `https://gateway.marvel.com:443`.


Furthermore, to make requests it is necessary to add app's bundle identifier as pre-authorized referrer on the Marvel API console. Currently it is `com.almeidaws.MarvelHeroes`.


## My personal experience

Create this project in just 4 days was a big challenge, but it was worthy. I used [CBL](https://www.challengebasedlearning.org/) to work (what is almost the same thing as study in IT, XD ) on this project.

I had just superficial knowledge about SwiftUI and even less about Combine before starting to code. So the challenge was to apply those two technologies while learning them, and taking care to create a high quality code and follow the best patterns.

I hope you like it!


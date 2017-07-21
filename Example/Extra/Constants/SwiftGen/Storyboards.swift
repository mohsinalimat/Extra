// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum FoundationExamples: String, StoryboardSceneType {
    static let storyboardName = "FoundationExamples"

    static func initialViewController() -> FoundationViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? FoundationViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case foundationExamplesScene = "FoundationExamples"
    static func instantiateFoundationExamples() -> FoundationViewController {
      guard let vc = StoryboardScene.FoundationExamples.foundationExamplesScene.viewController() as? FoundationViewController
      else {
        fatalError("ViewController 'FoundationExamples' is not of the expected class FoundationViewController.")
      }
      return vc
    }
  }
  enum Main: StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }
  }
  enum RealmExamples: String, StoryboardSceneType {
    static let storyboardName = "RealmExamples"

    case realmExamplesScene = "RealmExamples"
    static func instantiateRealmExamples() -> UIViewController {
      return StoryboardScene.RealmExamples.realmExamplesScene.viewController()
    }
  }
  enum UIKitExamples: String, StoryboardSceneType {
    static let storyboardName = "UIKitExamples"

    static func initialViewController() -> UIKitViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? UIKitViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case colorViewControllerScene = "ColorViewController"
    static func instantiateColorViewController() -> ColorViewController {
      guard let vc = StoryboardScene.UIKitExamples.colorViewControllerScene.viewController() as? ColorViewController
      else {
        fatalError("ViewController 'ColorViewController' is not of the expected class ColorViewController.")
      }
      return vc
    }

    case uiKitViewControllerScene = "UIKitViewController"
    static func instantiateUiKitViewController() -> UIKitViewController {
      guard let vc = StoryboardScene.UIKitExamples.uiKitViewControllerScene.viewController() as? UIKitViewController
      else {
        fatalError("ViewController 'UIKitViewController' is not of the expected class UIKitViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}


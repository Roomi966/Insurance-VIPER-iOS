import UIKit
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigation = storyboard.instantiateInitialViewController() as? UINavigationController,
              let root = navigation.viewControllers.first as? PoliciesViewController else { return }
        AppContainer.shared.inject(root)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }
}

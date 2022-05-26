//
//  SceneDelegate.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let storyBoard = UIStoryboard(name: TextAreaStoryBoard.home.rawValue, bundle: .main)
        
        let homeViewController = storyBoard.instantiateViewController(withIdentifier: HomeViewController.className)
        
        let navigation = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


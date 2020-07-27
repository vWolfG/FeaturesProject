//
//  SceneDelegate.swift
//  FeaturesProject
//
//  Created by Veronika Goreva on 7/8/20.
//  Copyright © 2020 v.wolf.g. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let vc = ListOfFeaturesViewController.instantiate(with: true)
        self.window!.rootViewController = vc
        self.window!.makeKeyAndVisible()
    }

}


//
//  AppDelegate.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit
import UniversitiesDetailsFeature
import UniversitiesListFeature
import Common

let APP = UIApplication.shared.delegate! as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        presentRootScreen()
        return true
    }
    
    
    fileprivate func presentRootScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let router = Router()
        let moduleAFacory = ModuleAFactory()
        let moduleBFacory = ModuleBFactory()
        router.ModulAFactory = moduleAFacory
        router.ModulBFactory = moduleBFacory
        
        let moduleAViewController = moduleAFacory.createModuleA(router: router)
        
        let navigationController = UINavigationController(rootViewController: moduleAViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    
}


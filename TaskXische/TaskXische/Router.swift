//
//  Router.swift
//  TestModularizationWithNavigation
//
//  Created by Eman Gaber on 01/05/2024.
//

import Foundation
import Common
import UIKit
import UniversitiesListFeature


class Router: Routable{
    var ModulAFactory: ModuleAFactoryProtocol?
    var ModulBFactory: ModuleBFactoryProtocol?
    
    func popToModuleA(from: UIViewController){
        let aVC = from.navigationController?.viewControllers.first as! ModuleAViewProtocol
        aVC.refreshData()
        from.navigationController?.popViewController(animated: true)
    }
    
    func navigateToModuleB(from: UIViewController , universityName: String,
                           universityWebPages: [String],
                           universityAlphaTwoCode: String,
                           universityStateProvince: String,
                           universityCountry: String){
        
        let view = ModulBFactory?.createModuleB(router: self ,universityName: universityName,universityWebPages:universityWebPages,universityAlphaTwoCode:  universityAlphaTwoCode,universityStateProvince: universityStateProvince,universityCountry:universityCountry)
        
        guard let view = view else{return}
        
        from.navigationController?.pushViewController(view, animated: true)
    }
    

}

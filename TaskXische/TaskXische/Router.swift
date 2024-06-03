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
    var ModulAFactory: UniversitiesListFactoryProtocol?
    var ModulBFactory: UniversitiesDetailsFactoryProtocol?
    
    func popToUniversitiesList(from: UIViewController){
        let aVC = from.navigationController?.viewControllers.first as! UniversitiesListViewProtocol
        aVC.refreshData()
        from.navigationController?.popViewController(animated: true)
    }
    
    func navigateToUniversitiesDetails(from: UIViewController , universityName: String,
                           universityWebPages: [String],
                           universityAlphaTwoCode: String,
                           universityStateProvince: String,
                           universityCountry: String){
        
        let view = ModulBFactory?.createUniversitiesDetails(router: self ,universityName: universityName,universityWebPages:universityWebPages,universityAlphaTwoCode:  universityAlphaTwoCode,universityStateProvince: universityStateProvince,universityCountry:universityCountry)
        
        guard let view = view else{return}
        
        from.navigationController?.pushViewController(view, animated: true)
    }
    

}

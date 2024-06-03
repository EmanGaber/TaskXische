//
//  UniversityDetailsContract.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import Foundation

protocol UniversityDetailsView: AnyObject {
    var presenter: UniversityDetailsPresenterInterface! { get set }
    

}

protocol UniversityDetailsContract: AnyObject {
    var presenter: UniversityDetailsPresenterInterface! { get set }
    
   
}

protocol UniversityDetailsPresenterInterface: AnyObject {
    func updateView(universityName: String?,
                    universityWebPages: [String]?,
                    universityAlphaTwoCode: String?,
                    universityStateProvince: String?,
                    universityCountry: String?)
}

protocol UniversityDetailsInteractorInterface: AnyObject {
   
}


protocol UniversityDetailsRouterInterface: AnyObject {
    func backToUniversitiesList()

}

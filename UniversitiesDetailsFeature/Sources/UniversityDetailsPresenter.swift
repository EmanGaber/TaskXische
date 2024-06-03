//
//  UniversityDetailsPresenter.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit

class UniversityDetailsPresenter: UniversityDetailsPresenterInterface {
    
   
    private weak var view: UniversityDetailsViewController?
    private var interactor: UniversityDetailsInteractorInterface!
    
    
    init(view: UniversityDetailsViewController?, interactor: UniversityDetailsInteractorInterface) {
        self.view = view
        self.interactor = interactor

    }
    
    func updateView(universityName: String?,
                    universityWebPages: [String]?,
                    universityAlphaTwoCode: String?,
                    universityStateProvince: String?,
                    universityCountry: String?)
    {
        view?.nameLbl.text = universityName ?? ""
        view?.stateLbl.text = universityStateProvince ?? ""
        view?.countryLbl.text = universityCountry ?? ""
        view?.countryCodeLbl.text = universityAlphaTwoCode ?? ""
        view?.webpageLbl.text = universityWebPages?.first ?? ""
    }
    
    
    
  
}

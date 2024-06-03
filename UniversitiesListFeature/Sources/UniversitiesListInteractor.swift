//
//  UniversitiesList.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit
import Foundation

class UniversitiesListInteractor: UniversitiesListInteractorInterface {
 
    weak var output: UniversitiesListInteractorOutput?
    
    func fetchUniversities(name: String) {
        
        PRODUCTDETAILSREPO.getUniversities(countryName: name) {[weak output] result in
            guard let output else {return}
            switch result {
            case .success(let universities):
                output.didGetUniversities(universities)
            case .failure(let error):
                output.didFailToGetUniversities(error)
           
            }
        }
        
        
    }
    
}

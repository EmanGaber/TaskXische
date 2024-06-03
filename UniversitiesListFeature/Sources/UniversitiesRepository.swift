//
//  UniversitiesRepository.swift
//  Fawterny
//
//  Created by Eman Gaber on 29/03/2024.
//

import Foundation

let PRODUCTDETAILSREPO = UniversitiesRepository.shared

class UniversitiesRepository: Repo {
    
    static let shared = UniversitiesRepository()
    
    func getUniversities(countryName: String,completion: @escaping (Result<[UniversitiesModel], Error>) -> Void) {
        provider.request(type: Array<UniversitiesModel>.self, service: Api.Universities.getUniversities(countryName)) { response in

            switch response {
            case let .success(models):
                completion(.success(models))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

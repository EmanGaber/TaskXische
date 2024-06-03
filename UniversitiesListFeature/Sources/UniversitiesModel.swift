//
//  UniversitiesModel.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import Foundation

struct UniversitiesModel: Codable {
    let domains: [String]?
    let name: String?
    let webPages: [String]?
    let alphaTwoCode: String?
    let stateProvince: String?
    let country: String?
    

    enum CodingKeys: String, CodingKey {
        case domains, name
        case webPages = "web_pages"
        case alphaTwoCode = "alpha_two_code"
        case stateProvince = "state-province"
        case country
    }
}

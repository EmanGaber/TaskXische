//
//  Universities.swift
//  Done
//
//  Created by Eman Gaber on 27/09/2023.
//

import Foundation

extension Api {
    
    enum Universities: ServiceProtocol {
        
        case getUniversities(_ name: String)
        
        var path: String {
            switch self {
            case .getUniversities:
                return API.serviceUniversities
            
            }
        }
        
        var method: HTTPMethod {
            switch self {
             case .getUniversities:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
           
            case let .getUniversities(name):
                return ["country" : name]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .getUniversities:
                return nil
            
            }
        }
        
        var body: Any? {
            switch self {
            case .getUniversities:
                return nil
           
            }
        }
    }
}

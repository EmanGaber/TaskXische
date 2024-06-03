//
//  API.swift
//  Network Layer
//
//  Created by Eman Gaber on 24/06/2022.
//  Copyright © 2022 Eman Gaber. All rights reserved.
//

import Foundation

/**
 APIConfigurations: Application Modes
 This enum reflict the application modes which can application follow them.
 
 - parameter debug: For the application during the development phase.
 - parameter stage: For the application during the testing phase.
 - parameter release: For the application during the launching on the store.
 */

#if DEBUG_DEV
let API = Api(.development)
#elseif DEBUG_STAGE
let API = Api(.stage)
#else
let API = Api(.release)
#endif

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "http://universities.hipolabs.com/"
        case .stage:
            return "http://universities.hipolabs.com/"
        case .release:
            return "http://universities.hipolabs.com/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
    
    // MARK: - USER
    
    let serviceUniversities = "search"
    
 
}

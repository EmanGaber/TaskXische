//
//  APIData.swift
//  Done
//
//  Created by Eman Gaber on 15/09/2023.
//  Copyright © 2023 Eman Gaber. All rights reserved.
//

import Foundation

/// The generic response for current API

struct APIData<T: Decodable>: Decodable {
    
    var status: Bool
    var message: String?
    var errors: ErrorsEnum?
    var data: T?
}

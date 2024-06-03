//
//  APIResponse.swift
//  Network Layer
//
//  Created by Eman Gaber on 24/06/2022.
//  Copyright © 2022 Eman Gaber. All rights reserved.
//

enum APIResponse<T> {
    
    case success(T)
    case failure(APIError)
    case complete
}

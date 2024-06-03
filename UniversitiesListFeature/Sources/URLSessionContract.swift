//
//  URLSessionContract.swift
//  Network Layer
//
//  Created by Eman Gaber on 24/06/2022.
//  Copyright © 2022 Eman Gaber. All rights reserved.
//

import Foundation
 
protocol URLSessionProviderProtocol {
    
    func request<T>(type: T.Type?, service: ServiceProtocol,completion: @escaping (Result<[UniversitiesModel], Error>) -> Void)
    
}

//
//  APIHeader.swift
//  Network Layer
//
//  Created by Eman Gaber on 24/06/2022.
//  Copyright © 2022 Eman Gaber. All rights reserved.
//

import Foundation

enum APIHeader: String {
    
    case accept = "Accept"
    case contentType = "Content-Type"
    case contentLenght = "Content-Length"
    case mutliPart = "multipart/form-data; boundary="
    case locale = "locale"
    case deviceOS = "deviceOs"
    case deviceId = "deviceId"
    case applicationVersion = "applicationVersion"
    case buildNumber = "buildNumber"
    case authorization = "Authorization"
    case applicationJson = "application/json"
    case ios = "iOS"
    case cityId = "city_id"
}

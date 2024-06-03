////
////  URLSessionProvider.swift
////  Network Layer
////
////  Created by Eman Gaber on 24/06/2022.
////  Copyright © 2022 Eman Gaber. All rights reserved.
////

import UIKit
import Common

let NETWORK = URLSessionProvider.shared

final class URLSessionProvider: URLSessionProviderProtocol {
//    func request<T>(type: T.Type?, service: ServiceProtocol,completion: @escaping (Result<[UniversitiesModel], Error>) -> Void) {
//        
//        let urlString = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates" // Replace with your API URL
//        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let models = try decoder.decode([UniversitiesModel].self, from: data)
//                completion(.success(models))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    
////        let request = URLRequest(service: service, cachePolicy: urlCahcePolicy(false), timeoutInterval: REQUEST_TIME)
////        var task: URLSessionDataTask? = nil
////        let startTime = startTime
////
////        task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
////            let httpResponse = response as? HTTPURLResponse
////            self?.handleResponse(task: task, data: data, response: httpResponse, startTime: startTime, error: error, completion: completion)
////        })
////        task?.resume()
//}
    

    static var shared = URLSessionProvider()
    
    private var session: URLSessionProtocol
    private let REQUEST_TIME = 80.0
    private var online = false
    private var startTime: UInt64 {
        get {
            DispatchTime.now().uptimeNanoseconds
        }
    }
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
        Network.reachability.delegate = self
    }
    
    private func urlCahcePolicy(_ isCache: Bool) -> URLRequest.CachePolicy {
        online = Network.reachability.isReachable
        return isCache ? (online ? .reloadIgnoringCacheData : .returnCacheDataDontLoad) : .reloadIgnoringCacheData
    }
    
    func request<T>(type: T.Type?, service: ServiceProtocol,completion: @escaping (Result<[UniversitiesModel], Error>) -> Void) {
        
        let request = URLRequest(service: service, cachePolicy: urlCahcePolicy(false), timeoutInterval: REQUEST_TIME)
          
        guard let url = request.url else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let models = try decoder.decode([UniversitiesModel].self, from: data)
                    completion(.success(models))
                } catch {
                    completion(.failure(error))
                }
            }

            task.resume()
 
    }
    
    
//    private func handleResponse<T: Decodable>(task: URLSessionDataTask?, data: Data?, response: HTTPURLResponse?, startTime: UInt64, error: Error?, completion: (APIResponse<T>) -> ())
//    {
//        var apiError: APIError?
//        
//        defer {
//            #if DEBUG || DEBUG_DEV || DEBUG_STAGE
//            self.info(task!, task?.originalRequest?.httpBody, data, response, self.responseTime(startTime), error, apiError?.type)
//            #endif
//        }
// 
//        guard error == nil else {
//            // MARK: UI Action
//            apiError = APIError(message: online ? "opps_something_went_wrong" : "internet_lost", type: online ? .server : .network)
//            //Banner.showError(title: apiError?.message)
//            return completion(.failure(apiError!))
//        }
//        
//        guard let response = response else {
//            // MARK: UI Action
//            apiError = APIError(type: response?.statusCode == 500 ? .noData : .parsing)
//           // Banner.showError(message: apiError?.message)
//            return completion(.failure(apiError!))
//        }
//        
//        do {
//            _ = try JSONDecoder().decode((APIData<T>).self, from: data!)
//        } catch let error {
//            print("Parsing Error ",error)
//        }
//        
//        guard let apiData = data, let result = try? JSONDecoder().decode((APIData<T>).self, from: apiData) else {
//            // MARK: UI Action
//            apiError = APIError(type: response.statusCode == 500 ? .noData : .parsing)
//            if response.statusCode != 401 {
//           //     Banner.showError(message: apiError?.message)
//            }
//            return completion(.failure(apiError!))
//        }
//        
//        switch response.statusCode {
//        case 200...299:
//            if result.status {
//                if let data = result.data {
//                    completion(.success(data))
//                } else {
//                    completion(.complete)
//                }
//            } else {
//                // MARK: UI Action
//                apiError = APIError(type: .server)
//                //Banner.showError(message: apiError?.message)
//                return completion(.failure(apiError!))
//            }
//        default:
//            apiError = APIError(code: response.statusCode, message: result.message, errors: result.errors, type: .known)
//            completion(.failure(apiError!))
//        }
//    }
    
//   
//    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
//        let request = URLRequest(service: service, cachePolicy: urlCahcePolicy(false), timeoutInterval: REQUEST_TIME)
//        var task: URLSessionDataTask? = nil
//        let startTime = startTime
//
//        task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
//            let httpResponse = response as? HTTPURLResponse
//            self?.handleResponse(task: task, data: data, response: httpResponse, startTime: startTime, error: error, completion: completion)
//        })
//        task?.resume()
//    }
//    private func handleResponse<T: Decodable>(task: URLSessionDataTask?, data: Data?, response: HTTPURLResponse?, startTime: UInt64, error: Error?, completion: (APIResponse<T>) -> ()) 
//    {
//        var apiError: APIError?
//        
//        defer {
//            #if DEBUG || DEBUG_DEV || DEBUG_STAGE
//            self.info(task!, task?.originalRequest?.httpBody, data, response, self.responseTime(startTime), error, apiError?.type)
//            #endif
//        }
// 
//        guard error == nil else {
//            // MARK: UI Action
//            apiError = APIError(message: online ? "opps_something_went_wrong" : "internet_lost", type: online ? .server : .network)
//            Banner.showError(title: apiError?.message)
//            return completion(.failure(apiError!))
//        }
//        
//        guard let response = response else {
//            // MARK: UI Action
//            apiError = APIError(type: response?.statusCode == 500 ? .noData : .parsing)
//            Banner.showError(message: apiError?.message)
//            return completion(.failure(apiError!))
//        }
//        
//        do {
//            _ = try JSONDecoder().decode((APIData<T>).self, from: data!)
//        } catch let error {
//            print("Parsing Error ",error)
//        }
//        
//        guard let apiData = data, let result = try? JSONDecoder().decode((APIData<T>).self, from: apiData) else {
//            // MARK: UI Action
//            apiError = APIError(type: response.statusCode == 500 ? .noData : .parsing)
//            if response.statusCode != 401 {
//                Banner.showError(message: apiError?.message)
//            }
//            return completion(.failure(apiError!))
//        }
//        
//        switch response.statusCode {
//        case 200...299:
//            if result.status {
//                if let data = result.data {
//                    completion(.success(data))
//                } else {
//                    completion(.complete)
//                }
//            } else {
//                // MARK: UI Action
//                apiError = APIError(type: .server)
//                Banner.showError(message: apiError?.message)
//                return completion(.failure(apiError!))
//            }
//        default:
//            apiError = APIError(code: response.statusCode, message: result.message, errors: result.errors, type: .known)
//            completion(.failure(apiError!))
//        }
//    }
    
//    private func responseTime(_ startTime: UInt64) -> Double {
//        let elapsedNanoseconds = DispatchTime.now().uptimeNanoseconds - startTime
//        return (TimeInterval(elapsedNanoseconds)/1e9).rounded(places: 2)
//    }
//    
//    private func info(_ task: URLSessionDataTask?, _ body: Data?, _ data: Data?, _ response: URLResponse?, _ requestTime: TimeInterval, _ error: Error?, _ errorType: APIErrorType?) {
//        let url: String = task?.originalRequest?.url?.absoluteString ?? ""
//        let headers: [String: String] = task?.originalRequest?.allHTTPHeaderFields ?? [:]
//        let statusCode: Int = (task?.response as? HTTPURLResponse)?.statusCode ?? 0
//        let response: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
//        let body: String = String(data: body ?? Data(), encoding: .utf8) ?? ""
//        let error: String = error?.localizedDescription ?? ""
//       // Console.logAPI(url, headers, body, statusCode, response, requestTime, error, errorType)
//    }
}

extension URLSessionProvider: ReachabilityDelegate {
    func networkStatusChanged() {
        online = Network.reachability.isReachable
    }
}

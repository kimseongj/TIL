//
//  DailyBoxOfficeEndpoint.swift
//  CombineTraining
//
//  Created by kimseongjun on 2023/04/25.
//

import Foundation

struct DailyBoxOfficeEndpoint {
    var baseURL: String = "http://kobis.or.kr"
    var path: String = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
    var method: String = "GET"
    var queryItems: [URLQueryItem] = [URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888"), URLQueryItem(name: "targetDt", value: "20230423")]
    var header: [String : String]?
    
    func makeURL() -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else { return nil }
        
        return url
    }
    
    func makeURLRequest() -> URLRequest? {
        guard let url = makeURL() else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        header?.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        
        return urlRequest
    }
}

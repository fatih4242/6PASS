//
//  RequestModel+Extension.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation
extension RequestModelProtocol {
    
    func generateRequest() -> URLRequest? {
      
        guard let url = generateURL(with: generateQueryItems())
        else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method?.rawValue
        
        //Girilen Header'lar Foreach ile çoğul hale geliyor
        headers?.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        return appendBodyIfNeeded(to: request)
    }
    
    private func generateURL(with queryItems: [URLQueryItem]) -> URL? {
        var endPoint: String = .empty
        
        //Girilen endpoint'ler Foreach ile çoğul hale geliyor
        paths?.forEach { path in
            endPoint = endPoint.appending(path)
        }
        endPoint = self.baseURL?.appending(endPoint) ?? .empty
        var urlComponents = URLComponents(string: endPoint)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url
        else { return nil }
        return url
    }
    
    private func generateQueryItems() -> [URLQueryItem]{
        var queryItem: [URLQueryItem] = []
        parameters?.forEach { parameter in
            let value = String(describing: parameter.value)
            queryItem.append(.init(name: parameter.key, value: value))
        }

        return queryItem
    }
    
    private func appendBodyIfNeeded(to request : URLRequest) -> URLRequest {
        var mutableRequest = request
        var jsonText: String = .empty
        
        guard method == RequestMethod.post else { return request }
        
        if let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted),
           let encodeJSON = String(data: data, encoding: .utf8) {
            jsonText = encodeJSON
        }
        
        let postData = jsonText.data(using: .utf8)
        mutableRequest.httpBody = postData
        return mutableRequest
    }
}

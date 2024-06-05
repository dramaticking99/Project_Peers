//
//  Request.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

//All http requests must conform to request

protocol Request {
    associatedtype Response
    associatedtype RequestError : Error
    
    var baseURl: URL { get }
    var method: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    
    func parse(from object: Any) throws -> Response
}

extension Request {
    
    var headers : [String: String] { return [:] }
    var body : Data? { return nil }
    
    func buildURLRequest() -> URLRequest {
        var url : URL = baseURl
        if #available(iOS 16.0, *) {
            url = path.isEmpty ? baseURl : baseURl.appending(path: path, directoryHint: .notDirectory)
        } else {
            url = path.isEmpty ? baseURl : baseURl.appendingPathComponent(path)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        urlRequest.httpBody = body
        return urlRequest
    }
    
}

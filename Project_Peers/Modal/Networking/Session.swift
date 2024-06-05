//
//  Session.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

class Session {
    func send<R: Request>(_ request: R, completion: @escaping (Result<R.Response, NetworkError>)-> Void) {
        let urlRequest = request.buildURLRequest()
        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let e = error {
                completion(.failure(.requestError(e)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let parsedResponse = try request.parse(from: data)
                completion(.success(parsedResponse))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        task.resume()
    }
}

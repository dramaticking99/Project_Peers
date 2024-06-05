//
//  CreatRequest.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

enum CreatRequest : Request {

    case general(default : Bool)
    
    typealias Response = String
    typealias RequestError = NetworkError
    
    var baseURl: URL {
        switch self {
        case .general:
            fallthrough
        default:
            let url = URL(string: "www.google.com")!
            return url
        }
    }
    
    var method: String {
        switch self {
        case .general:
            fallthrough
        default:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .general:
            fallthrough
        default:
            return "user/default"
        }
    }
    
    func parse(from object: Any) throws -> String {
        switch self {
        case .general:
            fallthrough
        default:
            return "Test"
        }
    }

}

//
//  CreatRequest.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

enum CreatRequest : Request {
    

    case general(default : Bool)
    case getChats(sender_Id: String)
    
    typealias Response = Data
    typealias RequestError = NetworkError
    
    var baseURl: URL {
        switch self {
        case .getChats:
            return Config.baseURL
        case .general:
            fallthrough
        default:
            let url = URL(string: "www.google.com")!
            return url
        }
    }
    
    var method: String {
        switch self {
        case .getChats:
            return "GET"
        case .general:
            fallthrough
        default:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .getChats:
            return "chat/getChats"
        case .general:
            fallthrough
        default:
            return "user/default"
        }
    }
    
    func parse(from data: Data) throws -> Data {
        switch self {
        case .getChats:
            return data
        case .general:
            fallthrough
        default:
            return "Test".data(using: .utf8)!
        }
    }

}

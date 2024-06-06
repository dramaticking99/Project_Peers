//
//  ChatAPIManager.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

class ChatAPIManager {
    
    static func getChats(sender_Id : String, completion: @escaping (Result<[ChatModel],NetworkError>)-> Void) {
        let request = CreatRequest.getChats(sender_Id: sender_Id)
        let session = Session()
        var chatsArray : [ChatModel]?
        session.send(request) { result in
            
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    chatsArray = try jsonDecoder.decode([ChatModel].self, from: data)
                    completion(.success(chatsArray!))
                    print(chatsArray!)
                } catch {
                    print("error Parsing the Data")
                    completion(.failure(.parsingError))
                }
            case .failure(let error):
                print("Request failed with error :\(error)")
                completion(.failure(.requestError(error)))
            }
        }
    }
}

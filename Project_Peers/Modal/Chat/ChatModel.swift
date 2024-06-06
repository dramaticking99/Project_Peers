//
//  ChatModel.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 04/06/24.
//

import Foundation


struct ChatModel : Codable, Equatable {
    var imageURL: String
    var receiver_Id: String
    var name: String
    
}

extension ChatModel {
    static func getDummyData(_ count: Int)-> [ChatModel] {
        var outputArray : [ChatModel] = []
        for i in 0..<count {
            let dummyModel = ChatModel( imageURL: "DummyProfileImageUrl\(1)", receiver_Id: "DummyUserId\(1)", name: "DummyName\(i)")
            outputArray.append(dummyModel)
        }
        return outputArray
    }
}



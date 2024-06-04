//
//  ChatModel.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 04/06/24.
//

import Foundation

struct ChatModel {
    var userId: String
    var userName: String
    var profileImageUrl: String
}

extension ChatModel {
    static func getDummyData(_ count: Int)-> [ChatModel] {
        var outputArray : [ChatModel] = []
        for i in 0..<count {
            let dummyModel = ChatModel(userId: "DummyUserId\(1)", userName: "DummyName\(i)", profileImageUrl: "DummyProfileImageUrl\(1)")
            outputArray.append(dummyModel)
        }
        return outputArray
    }
}



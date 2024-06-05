//
//  Error.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 06/06/24.
//

import Foundation

enum NetworkError: Error {
    case noData
    case parsingError
    case requestError(Error)
}

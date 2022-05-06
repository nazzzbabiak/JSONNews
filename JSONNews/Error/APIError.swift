//
//  APIError.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation

enum APIError: Error {
    case decodingError(String)
    case errorCode(Int)
    case unknown
}


extension APIError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodingError(let string):
            return "Помилка декоду об'єкту з сервіса \(string)"
            
        case .errorCode(let code):
            return "\(code) - Щось пішло не так"
        case .unknown:
            return "Невідома помилка"
        }
    }
}

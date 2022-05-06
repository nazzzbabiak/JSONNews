//
//  ResultStates.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation

enum ResultStates {
    
    case loading
    case success(content: [Result])
    case failed(error: Error)
    
}

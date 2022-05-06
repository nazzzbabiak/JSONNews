//
//  NewsEndPointMostShared.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import Foundation

protocol APIBuilderMostShared {
    
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    
}

enum NewsApiMostShared {
    case getNews
    
    private static let apiKey = "2BdeSV6CHBGDksz1YGTF7ahrHAxjrdON"
    static var numberOfDays = "30"
    
}

extension NewsApiMostShared: APIBuilderMostShared {
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/\(Self.numberOfDays).json?api-key=\(Self.apiKey)")!
        }
    }

    
    var urlRequest: URLRequest {
        return URLRequest(url: baseUrl)
    }
    
    
}

//
//  NewsEndPointMostViewed.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import Foundation

protocol APIBuilderMostViewed {
    
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    
}

enum NewsApiMostViewed {
    case getNews
    
    private static let apiKey = "2BdeSV6CHBGDksz1YGTF7ahrHAxjrdON"
    static var numberOfDays = "30"
    
}

extension NewsApiMostViewed: APIBuilderMostViewed {
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(Self.numberOfDays).json?api-key=\(Self.apiKey)")!
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: baseUrl)
    }
    
    
}

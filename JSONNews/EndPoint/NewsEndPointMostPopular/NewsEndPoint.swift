//
//  NewsEndPoint.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation
import Alamofire


protocol APIBuilder {
    
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    
}

enum NewsApiMostPopular {
    case getNews
    
    private static let apiKey = "2BdeSV6CHBGDksz1YGTF7ahrHAxjrdON"
    static var numberOfDays = "30"
    
}

extension NewsApiMostPopular: APIBuilder {
    
    
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/\(Self.numberOfDays).json?api-key=\(Self.apiKey)")!
        }
    }
    

    
    var urlRequest: URLRequest {
        return URLRequest(url: baseUrl)
    }
    
    
}

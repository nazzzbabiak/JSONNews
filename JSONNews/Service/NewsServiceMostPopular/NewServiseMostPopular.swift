//
//  NewsService.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation
import Combine
import CoreData
import Alamofire

protocol NewServiseMostPopular {
    func request(from endpoint: NewsApiMostPopular) -> AnyPublisher<NewResponse, APIError>
}

struct NewsServiseImpletationPopular: NewServiseMostPopular {
    
    func request(from endpoint: NewsApiMostPopular) -> AnyPublisher<NewResponse, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data , response -> AnyPublisher<NewResponse, APIError> in
                //
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    do {
                        let data = try jsonDecoder.decode(NewResponse.self, from: data)
                        
                
                    } catch (let error) {
                        print("error \(error)")
                    }
                    
                    return Just(data)
                        .decode(type: NewResponse.self, decoder: jsonDecoder)
                        .mapError { error in APIError.decodingError(error.localizedDescription) }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

//
//  NewViewModelShared.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import Foundation
import Combine
import CoreData


protocol NewsViewModelPopular {
    func getResult()
}


class NewsViewModelImpletationShared: ObservableObject , NewsViewModelPopular {
    
    private let service: NewsServiceMostShared
    
    private(set) var results = [Result]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultStates = .loading
    
    init(service: NewsServiceMostShared) {
        self.service = service
    }
    
    
    func getResult() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.results)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.results = response.results!
            }
        
        self.cancellables.insert(cancellable)
    }
}

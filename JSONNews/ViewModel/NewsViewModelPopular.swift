//
//  NewsViewModel.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation
import Combine
import CoreData
import Alamofire

class NewsViewModelImpletationPopular: ObservableObject {
    
    private let service: NewServiseMostPopular
    
    private(set) var results = [Result]()
    private var cancellables = Set<AnyCancellable>()
    
    private var task: Cancellable? = nil
    
    @Published private(set) var state: ResultStates = .loading
    
//    @Published var result : [Result] = []
        
    init(service: NewServiseMostPopular) {
        self.service = service
    }
    
//    func saveData(context: NSManagedObjectContext) {
//
//        result.forEach { (data) in
//
//            let entity = ResultCoreDatas(context: context)
//            entity.abstract = data.abstract
//            entity.byline = data.byline
//            entity.section = data.section
//            entity.source = data.source
//            entity.title = data.title
//            entity.update = data.updated
//            entity.url = data.url
//
//        }
//        do {
//            try context.save()
//            print("succses")
//        } catch {
//
//            print(error.localizedDescription)
//        }
//    }
    
    func getResult(
//        context: NSManagedObjectContext
    ) {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.results)
                    
//                    self.saveData(context: context)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.results = response.results!
                
            }
        
        self.cancellables.insert(cancellable)
    }
}

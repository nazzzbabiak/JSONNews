//
//  ViewRouter.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .viewed
    
}

enum Page {
    
    case emailed
    case shared
    case viewed
    case saved
    
}

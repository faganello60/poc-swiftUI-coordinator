//
//  ListViewModel.swift
//  POC-SwiftUI
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import Foundation
import SwiftUI

final class ListViewModel: ObservableObject {
    
    @Published private(set) var state: ListView.State = .idle
    var selectCategory: ((String) -> Void)?

    var categories: [String] = []
    
    init() {}
    
    func viewDidAppear() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.loadCategories()
        }
    }
    
    func onDeleteRow(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
        state = .loaded(categories)
    }
    
    private func loadCategories() {
        categories = ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]
        state = .loaded(categories)
    }
}


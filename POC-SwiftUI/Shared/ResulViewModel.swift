//
//  ResulViewModel.swift
//  POC-SwiftUI
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import Foundation

class ResultViewModel: ObservableObject {
    @Published private(set) var title: String
    var openModal: (() -> Void)?

    init(title: String) {
        self.title = title
    }
}

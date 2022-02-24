//
//  ResulViewCoodinator.swift
//  POC-SwiftUI
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import Foundation
import SwiftUI

struct ResultViewCoordinator: Coordinator {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultView(viewModel: viewModel.resultViewModel)
            .fullScreenCover(isPresented: $viewModel.published) {
                
            }
//            .sheet(isPresented: $viewModel.published) {
//                Text("Foi")
//            }
            
    }
}


extension ResultViewCoordinator {
    class ViewModel: ObservableObject {
        let resultViewModel: ResultViewModel
        @Published var published: Bool
        init(resultViewModel: ResultViewModel) {
            self.resultViewModel = resultViewModel
            published = false
            resultViewModel.openModal = { [weak self] in
                self?.published = true
            }
        }
    }
}

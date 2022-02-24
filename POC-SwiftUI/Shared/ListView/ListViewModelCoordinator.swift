//
//  ListViewModelCoordinator.swift
//  POC-SwiftUI
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import SwiftUI
import Combine

typealias Coordinator = View

struct ListViewCoordinator: Coordinator {
    
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ListView(viewModel: viewModel.listViewModel)
            .overlay(postNavLink)
    }
    
    
    private var postNavLink: some View {
        NavigationLink(
            destination: viewModel.resultViewModel.map(ResultViewCoordinator.init),
            isActive: .init(
                get: { self.viewModel.resultViewModel != nil },
                set: { isActive in
                    if !isActive {
                        viewModel.resultViewModel = nil
                    }
                }
            ),
            label: EmptyView.init
        )
    }
    
}

extension ListViewCoordinator {
    class ViewModel: ObservableObject {
        let listViewModel: ListViewModel
        @Published var resultViewModel: ResultViewCoordinator.ViewModel?

        init(listViewModel: ListViewModel = ListViewModel()) {
            self.listViewModel = listViewModel
            
            
            listViewModel.selectCategory = { [weak self] category in
                self?.resultViewModel = .init(
                    resultViewModel: .init(title: category)
                )
            }
        }
    }
}

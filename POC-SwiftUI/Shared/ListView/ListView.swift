//
//  ContentView.swift
//  Shared
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import SwiftUI

struct ListView: View {
    
    enum State: Equatable {
        case idle
        case loading
        case failed(NSError)
        case loaded([String])
    }
    
    @ObservedObject private(set) var viewModel = ListViewModel()
    
    var body: some View {
        var mainView: AnyView
        
        switch viewModel.state {
        case .idle:
            mainView = AnyView(idleView)
        case .loading:
            mainView = AnyView(loadingView)
        case .failed(_):
            mainView = AnyView(Text("Error"))
        case .loaded(let categories):
            mainView = AnyView(resultView(categories))
        }
        
        return mainView
    }
}

extension ListView {
    private var idleView: some View {
        Color.clear
            .onAppear {
                viewModel.viewDidAppear()
            }
    }
    
    private var loadingView: some View {
        HStack {
            Spacer()
            ProgressView()
                .scaleEffect(2.0)
            Spacer()
        }
    }
    
    private func resultView(_ categories:[String]) -> some View {
        List {
            ForEach(categories, id: \.self) { category in
                Text(category)
                    .overlay(
                        Button(action: { viewModel.selectCategory?(category) } ) {
                            EmptyView()
                        }
                    )
            }
            .onDelete(perform: viewModel.onDeleteRow(at:))
        }
        .navigationTitle("Categorias")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

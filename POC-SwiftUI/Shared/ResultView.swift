//
//  ResultView.swift
//  POC-SwiftUI
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject private(set) var viewModel: ResultViewModel
    
    var body: some View {
        Text(viewModel.title)
        Button(action: { viewModel.openModal?() } ) {
            Text("Modal")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: .init(title: "Teste"))
    }
}

//
//  POC_SwiftUIApp.swift
//  Shared
//
//  Created by Bruno Faganello Neto on 17/02/22.
//

import SwiftUI

@main
struct POC_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListViewCoordinator(viewModel: .init())
            }
        }
    }
}

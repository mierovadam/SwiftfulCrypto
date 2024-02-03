//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 18/12/2023.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}

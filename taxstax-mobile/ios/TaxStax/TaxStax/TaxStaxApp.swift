//
//  TaxStaxApp.swift
//  TaxStax
//
//  Created by Florian Knaus on 3/19/24.
//

import SwiftUI

@main
struct TaxStaxApp: App {
    @State public var isLoaded = false
    var body: some Scene {
        WindowGroup {
            if !isLoaded {
                LoadView(_parent: self)
            } else {
                ContentView()
            }
        }
    }
}

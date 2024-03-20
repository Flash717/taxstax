//
//  ContentView.swift
//  TaxStax
//
//  Created by Florian Knaus on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    @State public var selectedView = 0
    var body: some View {
        VStack {
            Spacer()
            TabView(selection: $selectedView){
                DefaultView().tag(0)
                ReceiptView().tag(1)
                SearchView().tag(2)
                CameraView().tag(3)
                ReportView().tag(4)
                ProfileView().tag(5)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
            MenuView(parent: self)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

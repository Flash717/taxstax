//
//  MenuView.swift
//  TaxStax
//
//  Created by Florian Knaus on 3/20/24.
//

import SwiftUI

struct MenuView: View {
    private let _parent: ContentView
    
    init(parent: ContentView) {
        _parent = parent
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 80)
                .offset(y:10)
                .foregroundColor(.blue)
            HStack {
                VStack {
                    Image(systemName: "doc.plaintext").foregroundColor(.white)
                    Text("Receipts").foregroundColor(.white)
                }.onTapGesture {
                    _parent.selectedView = 1
                    print("Receipts")
                }
                VStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.white)
                    Text("Search").foregroundColor(.white)
                }.onTapGesture {
                    _parent.selectedView = 2
                    print("Search")
                }
                Button(action: {
                    _parent.selectedView = 3
                    print("click")
                }) {
                    ZStack {
                        Circle()
                            .strokeBorder(.blue, lineWidth: 5)
                            .background(Circle().fill(.white))
                            .frame(width: 70, height: 70)
                        Image(systemName: "camera")
                            .foregroundColor(.blue)
                            .font(.system(size: 30))
                    }.offset(y: -15)
                }
                VStack {
                    Image(systemName: "lightbulb").foregroundColor(.white)
                    Text("Reports").foregroundColor(.white)
                }.onTapGesture {
                    _parent.selectedView = 4
                    print("Reports")
                }
                VStack {
                    Image(systemName: "person.crop.circle").foregroundColor(.white)
                    Text("Profile").foregroundColor(.white)
                }.onTapGesture {
                    _parent.selectedView = 5
                    print("Profile")
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(parent: ContentView())
    }
}

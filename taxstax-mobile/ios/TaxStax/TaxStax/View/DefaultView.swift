//
//  DefaultView.swift
//  TaxStax
//
//  Created by Florian Knaus on 3/20/24.
//

import SwiftUI

struct DefaultView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}

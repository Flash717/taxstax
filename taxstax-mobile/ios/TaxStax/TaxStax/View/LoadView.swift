//
//  LoadView.swift
//  TaxStax
//
//  Created by Florian Knaus on 3/19/24.
//

import SwiftUI

struct LoadView: View {
    @State private var progress = 0.0
    private let _parent: TaxStaxApp
    private let _pauseTime = 0.2
    
    let _version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let _build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    init(_parent: TaxStaxApp) {
        self._parent = _parent
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("TaxStax").fontWeight(.heavy)
            Spacer()
            ProgressView(value: progress)
            Text("Version: " + self._version)
            Text("Build: " + self._build)
            Spacer()
        }
        .onAppear() {
            load()
        }
    }
    
    func load() {
        //TODO: replace with meaningful loading
        incProg(current: 1, limit: 10)
    }
    
    //simulates progress bar
    func incProg(current: Int, limit: Int) {
        progress = Double(current) * 0.1
        if current < limit {
            DispatchQueue.main.asyncAfter(deadline: .now() + _pauseTime) {
                incProg(current: current + 1, limit: limit)
            }
        } else {
            print("Loaded")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                _parent.isLoaded.toggle()
            }
        }
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView(_parent: TaxStaxApp())
    }
}

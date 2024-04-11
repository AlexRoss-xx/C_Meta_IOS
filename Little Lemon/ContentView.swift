//
//  ContentView.swift
//  Little Lemon
//
//  Created by Alexey Rasskazov on 05/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue:String = "Alex Siri"
    var body: some View {
        TextField("Name", text:$inputValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

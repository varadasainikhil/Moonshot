//
//  ContentView.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}

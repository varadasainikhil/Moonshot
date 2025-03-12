//
//  ContentView.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        Text(String(astronauts.count))
        Text(String(missions.count))
    }
}

#Preview {
    ContentView()
}

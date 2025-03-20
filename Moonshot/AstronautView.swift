//
//  AstronautView.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/20/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    let mission : Mission
    let role : String
    
    var body: some View {
        ScrollView{
            VStack{
                Text(astronaut.id)
                    .font(.title.bold())
                
                Text("\(role) of \(mission.displayName)")
                
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 300)
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        
    }
    
    init(astronaut: Astronaut, mission: Mission, role : String) {
        self.astronaut = astronaut
        self.mission = mission
        self.role = role
    }
}

#Preview {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let mission = missions[11]
    let astronaut = astronauts["armstrong"] ?? astronauts["grissom"]
    
    AstronautView(astronaut: (astronaut ?? astronauts["grissom"])!, mission: mission , role: "Commander")
}

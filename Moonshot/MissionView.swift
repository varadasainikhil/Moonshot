//
//  MissionView.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/20/25.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){width, axis in
                        width * 0.6
                    }
                    .padding()
                
                Text("Launch Date : \(mission.formattedLaunchDate)")
                    .font(.title2.bold())
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                
                VStack(alignment: .leading){
                    
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                    
                    Text(mission.description)
                }
                .padding()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(crew, id: \.role){ crewMember in
                            NavigationLink{
                                AstronautView(astronaut: crewMember.astronaut, mission: mission, role: crewMember.role)
                            } label:{
                                HStack{
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width:104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth:1)
                                        )
                                    
                                    VStack(alignment: .leading){
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundStyle(.gray)
                                        
                                    }
                                }
    
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission : Mission, astronauts : [String : Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            } else{
                fatalError("Missing \(member.name)")
            }
            
        }
    }
    
}

#Preview {
    let mission_array : [Mission] = Bundle.main.decode("missions.json")
    let mission = mission_array[0]
    let astronauts :[String : Astronaut]  = Bundle.main.decode("astronauts.json")
    MissionView(mission: mission, astronauts: astronauts)
        .preferredColorScheme(.dark)
}

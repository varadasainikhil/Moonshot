//
//  MissionView.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/20/25.
//

import SwiftUI

struct MissionView: View {
    let mission : Mission
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
                
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
}

#Preview {
    let mission_array : [Mission] = Bundle.main.decode("missions.json")
    let mission = mission_array[0]
    MissionView(mission: mission)
        .preferredColorScheme(.dark)
}

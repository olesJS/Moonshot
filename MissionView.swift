//
//  MissionView.swift
//  MoonApp
//
//  Created by Олексій Якимчук on 28.06.2023.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.75)
                        .padding(.bottom)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.title2.bold())
                }
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding([.horizontal, .bottom])
                    
                    Text(mission.description)
                        .padding(.horizontal)
                    
                    Divider()
                        .padding()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.horizontal)
                }
                    
                CrewView(mission: mission, astronauts: astronauts)
            }
            .navigationTitle(mission.officialName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.navyBlue)
            .preferredColorScheme(.dark)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View { 
        MissionView(mission: missions[2], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

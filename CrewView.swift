//
//  CrewView.swift
//  MoonApp
//
//  Created by Олексій Якимчук on 28.06.2023.
//

import SwiftUI

struct CrewView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    let mission: Mission
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(width: 170, height: 150)
                                .padding(.horizontal, 5)
                            
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                            }
                        }
                        .padding(10)
                        .background(.blueGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 5)
                    }
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)!")
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewView(mission: missions[2], astronauts: astronauts)
    }
}

//
//  ListView.swift
//  MoonApp
//
//  Created by Олексій Якимчук on 28.06.2023.
//

import SwiftUI

struct ListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        VStack {
            List {
                ForEach(missions) { mission in
                    VStack {
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack {
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 100)
                                    .padding(5)
                                
                                VStack {
                                    Text(mission.officialName)
                                        .font(.title2.bold())
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.footnote).opacity(0.8)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.blueGreen)
                            }
                            .background(.blueGrotto)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.navyBlue)
                            )
                        }
                    }
                }
                .listRowBackground(Color.navyBlue)
            }
            .listStyle(.plain)
            .preferredColorScheme(.dark)
            .background(.navyBlue)
            .scrollContentBackground(.hidden)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListView(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

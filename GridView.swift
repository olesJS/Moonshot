//
//  GridView.swift
//  MoonApp
//
//  Created by Олексій Якимчук on 28.06.2023.
//

import SwiftUI

struct GridView: View {
    let layout = [GridItem(.adaptive(minimum: 150))]
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.officialName)
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.footnote).opacity(0.8)
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
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
            .padding([.horizontal, .bottom])
        }
        .background(.navyBlue)
        .preferredColorScheme(.dark)
    }
}


struct GridView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        GridView(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}

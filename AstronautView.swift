//
//  AstronautView.swift
//  Moonshot
//
//  Created by Олексій Якимчук on 25.06.2023.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                    
                Divider()
                    .padding()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}

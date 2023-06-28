//
//  ContentView.swift
//  MoonApp
//
//  Created by Олексій Якимчук on 27.06.2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGrid: Bool = true
    
    var body: some View {
        NavigationView {
            Group {
                if isGrid {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(missions: missions, astronauts: astronauts)
                }
            }
            .toolbar {
                Button {
                    isGrid.toggle()
                } label: {
                    isGrid ? Image(systemName: "list.dash") : Image(systemName: "square.grid.2x2")
                }
            }
            .navigationTitle("MoonApp")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

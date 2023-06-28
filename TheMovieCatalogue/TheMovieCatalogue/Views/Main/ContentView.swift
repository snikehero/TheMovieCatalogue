//
//  ContentView.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button {
                let movie = 157336
                let endpoint: MovieEndpoint = .movie(movie)
                print(endpoint.path)
                fetchMovie(from: endpoint.url)
                
            } label: {
                Text("Hola")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

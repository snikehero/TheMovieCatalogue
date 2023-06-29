//
//  MainView.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        // carousel view(Popularmovies)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                let movie = 157336
                let endpoint: MovieEndpoint = .movie(movie)
                print(endpoint.path)
                mainViewModel.fetchPopularMovies(from: endpoint.url)
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

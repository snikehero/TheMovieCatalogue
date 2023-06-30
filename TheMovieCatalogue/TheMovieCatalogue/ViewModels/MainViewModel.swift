//
//  MainViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

extension MainView {
    @MainActor class MainViewModel: ObservableObject {
        @Published var randomPosterImage: String = ""
        @Published var trendingMovies: [Movie] = []
        @Published var popularMovies = PopularMovies()
        var networkManager = NetworkManager()
        
//        func getRecommendation(){
//            let recommendation: Movie = networkManager.getRandomMovie()
//
//            return recommendation
//        }
        
        // fetch popularMovies
        func fetchPopularMovies(from url: URL) {
            // Create endpoint
            self.popularMovies = networkManager.fetchPopular(from: url)
        }
        // fetch trendingMovies
    }
}

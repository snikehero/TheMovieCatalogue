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
        @Published var popularMovies: [Movie] = []
        var networkManager = NetworkManager()
        
//        func getRecommendation(){
//            let recommendation: Movie = networkManager.getRandomMovie()
//
//            return recommendation
//        }
        
        // fetch popularMovies
        // fetch trendingMovies
    }
    
}

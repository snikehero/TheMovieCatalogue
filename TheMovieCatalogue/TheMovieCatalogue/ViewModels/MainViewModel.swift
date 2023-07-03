//
//  MainViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var randomPosterImage: String = ""
    @Published var randomMovie: Movie?
    @Published var trendingMovies: [Movie] = []
    @Published var popularMovies = PopularMovies()
    var networkManager = NetworkManager()
    
    func fetchRandomMovie(){
        let movie = 157336
        let endpoint: MovieEndpoint = .movie(movie)
        
        networkManager.fetchMovie(from: endpoint.url) { movie in
            if let movie = movie {
                self.randomMovie = movie
            }
        }
    }
    
    func fetchPopularMovies(from url: URL) {
        self.popularMovies = networkManager.fetchPopular(from: url)
    }
}

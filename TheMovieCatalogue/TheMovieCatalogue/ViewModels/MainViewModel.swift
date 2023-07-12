//
//  MainViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var randomPosterImage: String = ""
    @Published var randomMovie: MovieListItem?
    @Published var movie: Movie?
    @Published var trendingMovies: [Movie] = []
    @Published var popularMovies : MovieListPage?
    @Published var nowPlaying : MovieListPage?
    
    private var networkManager = NetworkManager()
    
    func fetchMovie(withId id: Int) {
        networkManager.fetchMovie(withId: id) { movie in
            if let movie = movie {
                DispatchQueue.main.async {
                    self.movie = movie
                }
            }
        }
    }
    
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchPopulars(withPage: page) { populars in
            if let populars = populars {
                DispatchQueue.main.async {
                    self.popularMovies = populars
                    if self.randomMovie == nil {
                        self.randomMovie = populars.results.randomElement()
                        self.randomMovie?.posterSize = "w500"
                    }
                }
            }
        }
    }
    
    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchNowPlaying(withPage: page) { nowplaying in
            if let nowplaying = nowplaying {
                DispatchQueue.main.async {
                    self.nowPlaying = nowplaying
                }
            }
        }
    }
}

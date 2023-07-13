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
    @Published var popularMovies : MovieListPage?
    @Published var nowPlaying : MovieListPage?
    @Published var topRated : MovieListPage?
    
    var networkManager = NetworkManager()
    
    func fetchMovie(withId id: Int) {
        networkManager.fetchData(endpoint: .movie(id), type: Movie.self) { movie in
            if let movie = movie {
                DispatchQueue.main.async {
                    self.randomMovie = movie
                }
            }
        }
    }
    
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchData(endpoint: .popular(page), type: MovieListPage.self) { populars in
            if let populars = populars {
                DispatchQueue.main.async {
                    self.popularMovies = populars
                }
            }
        }
    }
    
    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchData(endpoint: .nowPlaying(page), type: MovieListPage.self) { nowPlaying in
            if let nowPlaying = nowPlaying {
                DispatchQueue.main.async {
                    self.nowPlaying = nowPlaying
                }
            }
        }
    }
    
    func fetchTopRated(withPage page: Int) {
        networkManager.fetchData(endpoint: .topRated(page), type: MovieListPage.self) { topRated in
            if let topRated = topRated {
                DispatchQueue.main.async {
                    self.topRated = topRated
                }
            }
        }
    }
}

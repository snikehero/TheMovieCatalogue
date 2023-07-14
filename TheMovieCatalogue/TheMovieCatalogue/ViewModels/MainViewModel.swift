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
        networkManager.fetchData(endpoint: .movie(id), type: Movie.self) { movie in
            if let movie = movie {
                DispatchQueue.main.async { [weak self] in
                    self?.movie = movie
                }
            }
        }
    }
    
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchData(endpoint: .popular(page), type: MovieListPage.self) { populars in
            if let populars = populars {
                DispatchQueue.main.async { [weak self] in
                    self?.popularMovies = populars
                }
            }
        }
    }
    
    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchData(endpoint: .nowPlaying(page), type: MovieListPage.self) { nowPlaying in
            if let nowPlaying = nowPlaying {
                DispatchQueue.main.async { [weak self] in
                    self?.nowPlaying = nowPlaying
                }
            }
        }
    }
    
    func fetchTopRated(withPage page: Int) {
        networkManager.fetchData(endpoint: .topRated(page), type: MovieListPage.self) { topRated in
            if let topRated = topRated {
                DispatchQueue.main.async { [weak self] in
                    self?.chooseRandomMovie(from: topRated.results)
                }
            }
        }
    }
    
    func chooseRandomMovie(from moviesArray: [MovieListItem]) {
        if self.randomMovie == nil {
            self.randomMovie = moviesArray.randomElement()
            self.randomMovie?.posterSize = "w500"
        }
    }
}

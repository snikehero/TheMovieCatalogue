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
    @Published var topRated : MovieListPage?
    private var networkManager = NetworkManager()
    private let endpointBuilder = EndpointBuilder()
    func fetchMovie(withId id: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getMovieURL(id: id), type: Movie.self) { movie in
            if let movie = movie {
                DispatchQueue.main.async { [weak self] in
                    self?.movie = movie
                }
            }
        }
    }
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getPopularURL(page: page),
                                 type: MovieListPage.self) { populars in
            if let populars = populars {
                DispatchQueue.main.async { [weak self] in
                    self?.popularMovies = populars
                }
            }
        }
    }
    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getNowPlayingURL(page: page),
                                 type: MovieListPage.self) { nowPlaying in
            if let nowPlaying = nowPlaying {
                DispatchQueue.main.async { [weak self] in
                    self?.nowPlaying = nowPlaying
                }
            }
        }
    }
    func fetchTopRated() {
        let randomPage = Int.random(in: 1...5)
        networkManager.fetchData(endpoint: endpointBuilder.getTopRatedURL(page: randomPage),
                                 type: MovieListPage.self) { topRated in
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
            self.randomMovie?.posterSize = ImageSize.width500
        }
    }
}

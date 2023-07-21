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
    @Published var trendingMovies: [MovieDetails] = []
    @Published var popularMovies : [MovieListItem] = []
    @Published var nowPlaying : [MovieListItem] = []
    @Published var topRated : MovieListPage?
    private var networkManager = NetworkManager()
    private let endpointBuilder = EndpointBuilder()
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getPopularURL(page: page),
                                 type: MovieListPage.self) { populars in
            if let populars = populars {
                DispatchQueue.main.async { [weak self] in
                    self?.popularMovies = populars.results
                }
            }
        }
    }
    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getNowPlayingURL(page: page),
                                 type: MovieListPage.self) { nowPlaying in
            if let nowPlaying = nowPlaying {
                DispatchQueue.main.async { [weak self] in
                    self?.nowPlaying = nowPlaying.results
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

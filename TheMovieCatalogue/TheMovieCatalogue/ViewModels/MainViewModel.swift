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
    
    @Published var errorMessage: String? = nil

    private var networkManager = NetworkManager()
    private let endpointBuilder = EndpointBuilder()
    
    func fetchPopularMovies(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getPopularURL(page: page),
                                 type: MovieListPage.self) { result in
            switch result {
            case .success(let populars):
                DispatchQueue.main.async { [weak self] in
                    self?.popularMovies = populars.results
                }
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }

    func fetchNowPlaying(withPage page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getNowPlayingURL(page: page),
                                 type: MovieListPage.self) { result in
            switch result {
            case .success(let nowPlaying):
                DispatchQueue.main.async { [weak self] in
                    self?.nowPlaying = nowPlaying.results
                }
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }

    func fetchTopRated() {
        let randomPage = Int.random(in: 1...5)
        networkManager.fetchData(endpoint: endpointBuilder.getTopRatedURL(page: randomPage),
                                 type: MovieListPage.self) { result in
            switch result {
            case .success(let topRated):
                DispatchQueue.main.async { [weak self] in
                    self?.chooseRandomMovie(from: topRated.results)
                }
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }

    private func handle(error: NetworkManager.NetworkError) {
        switch error {
        case .notFound:
            errorMessage = "Resource not found."
        case .badRequest:
            errorMessage = "Bad request."
        case .serverError:
            errorMessage = "Server error."
        default:
            errorMessage = "An unknown error occurred."
        }
    }

    func chooseRandomMovie(from moviesArray: [MovieListItem]) {
        if self.randomMovie == nil {
            self.randomMovie = moviesArray.randomElement()
            self.randomMovie?.posterSize = ImageSize.width500
        }
    }
}

extension MainViewModel {
    static let moviesMock = [MovieListItem(id: 268, posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg"),
                             MovieListItem(id: 129, posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg"),
                             MovieListItem(id: 112, posterPath: "/hOb6ODI7QQFKkOe3eJU2Fdh2fk1.jpg"),
                             MovieListItem(id: 113, posterPath: "/NNxYkU70HPurnNCSiCjYAmacwm.jpg"),
                             MovieListItem(id: 114, posterPath: "/8riWcADI1ekEiBguVB9vkilhiQm.jpg"),
                             MovieListItem(id: 115, posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"),
                             MovieListItem(id: 116, posterPath: "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg")]
}

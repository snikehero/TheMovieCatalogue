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
    @Published var hasError: Bool = false

   
    var posterString: String {
           randomMovie?.posterString ?? "0"
       }
    var networkManager = NetworkManager()
    let endpointBuilder = EndpointBuilder()
    
    
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
        hasError = true
    }

    func chooseRandomMovie(from moviesArray: [MovieListItem]) {
        if self.randomMovie == nil {
            self.randomMovie = moviesArray.randomElement()
            self.randomMovie?.posterSize = ImageSize.width500
        }
    }
}

extension MainViewModel {
    static let moviesMock = [MovieListItem(id: 268, title: "Mock 1", posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg"),
                             MovieListItem(id: 129, title: "Mock 2", posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg"),
                             MovieListItem(id: 112, title: "Mock 3", posterPath: "/hOb6ODI7QQFKkOe3eJU2Fdh2fk1.jpg"),
                             MovieListItem(id: 113, title: "Mock 4", posterPath: "/NNxYkU70HPurnNCSiCjYAmacwm.jpg"),
                             MovieListItem(id: 114, title: "Mock 5", posterPath: "/8riWcADI1ekEiBguVB9vkilhiQm.jpg"),
                             MovieListItem(id: 115, title: "Mock 6", posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"),
                             MovieListItem(id: 116, title: "Mock 7", posterPath: "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg")]
}

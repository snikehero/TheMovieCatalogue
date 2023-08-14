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
    @Published var showingSheet: Bool = false
    @Published var movieDetailsViewModel = MovieDetailsViewModel()

     var networkManager = NetworkManager()
     let endpointBuilder = EndpointBuilder()
    var posterString: String {
        randomMovie?.posterString ?? "0"
    }
    
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
extension MainViewModel {
    static let moviesMock = [MovieListItem(id: 268, title: "Mock 1", posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg"),
                             MovieListItem(id: 129, title: "Mock 2", posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg"),
                             MovieListItem(id: 112, title: "Mock 3", posterPath: "/hOb6ODI7QQFKkOe3eJU2Fdh2fk1.jpg"),
                             MovieListItem(id: 113, title: "Mock 4", posterPath: "/NNxYkU70HPurnNCSiCjYAmacwm.jpg"),
                             MovieListItem(id: 114, title: "Mock 5", posterPath: "/8riWcADI1ekEiBguVB9vkilhiQm.jpg"),
                             MovieListItem(id: 115, title: "Mock 6", posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"),
                             MovieListItem(id: 116, title: "Mock 7", posterPath: "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg")]
}

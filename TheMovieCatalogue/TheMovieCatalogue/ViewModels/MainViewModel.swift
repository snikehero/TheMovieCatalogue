//
//  MainViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var randomPosterImage: String = ""
    @Published var trendingMovies: [Movie] = []
    @Published var popularMovies : PopularMovies?
    var networkManager = NetworkManager()

    func fetchPopularMovies() {
        let page = 1
        let endpoint: MovieEndpoint = .popular(page)
        
        networkManager.fetchPopular(from: endpoint.url) { populars in
            if let populars = populars{
                self.popularMovies = populars
            }
        }
    }
}

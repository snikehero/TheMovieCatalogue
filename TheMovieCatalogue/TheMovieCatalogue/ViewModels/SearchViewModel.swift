//
//  SearchViewModel.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 27/07/23.
//

import Foundation

@MainActor class SearchViewModel: ObservableObject {
    @Published var genres : [Genre] = []
    @Published var searchResults : [MovieListItem] = []
    @Published var byGenre : [MovieListItem] = []
    var networkManager = NetworkManager()
    let endpointBuilder = EndpointBuilder()
    func fetchGenres() {
        networkManager.fetchData(endpoint: endpointBuilder.getGenresURL(),
                                 type: GenreListPage.self) { genreListPage in
            if let genreListPage = genreListPage {
                DispatchQueue.main.async { [weak self] in
                    self?.genres = genreListPage.genres
                }
            }
        }
    }

    func fetchSearchList(search: String) {
        networkManager.fetchData(endpoint: endpointBuilder.getMovieListBySearch(searchText: search, withPage: 1),
                                 type: MovieListPage.self) { coincidences in
            if let coincidences = coincidences {
                DispatchQueue.main.async { [weak self] in
                    self?.searchResults = coincidences.results
                }
            }
        }
    }

    func fetchByGenre(genre: String, page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getMoviesByGenreURL(genre: genre, page: page),
                                    type: MovieListPage.self) { found in
            if let found = found {
                DispatchQueue.main.async { [weak self] in
                    self?.byGenre = found.results
                }
            }
        }
    }
}

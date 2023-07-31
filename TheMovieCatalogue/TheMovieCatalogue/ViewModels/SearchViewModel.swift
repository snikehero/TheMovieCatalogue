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

    private var networkManager = NetworkManager()
    private let endpointBuilder = EndpointBuilder()
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
        networkManager.fetchData(endpoint: endpointBuilder.getMovieListBySearch(searchText: search),
                                 type: MovieListPage.self) { coincidences in
            if let coincidences = coincidences {
                DispatchQueue.main.async { [weak self] in
                    self?.searchResults = coincidences.results
                }
            }
        }
    }
}

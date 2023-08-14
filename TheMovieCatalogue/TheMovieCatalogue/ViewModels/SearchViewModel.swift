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
    @Published var hasError: Bool = false
    @Published var errorMessage: String? = nil

    var networkManager = NetworkManager()
    let endpointBuilder = EndpointBuilder()

    func fetchGenres() {
        networkManager.fetchData(endpoint: endpointBuilder.getGenresURL(),
                                 type: GenreListPage.self) { result in
            switch result {
            case .success(let genreListPage):
                DispatchQueue.main.async { [weak self] in
                    self?.genres = genreListPage.genres
                }
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }

    func fetchSearchList(search: String) {
        networkManager.fetchData(endpoint: endpointBuilder.getMovieListBySearch(searchText: search, withPage: 1),
                                 type: MovieListPage.self) { result in
            switch result {
            case .success(let coincidences):
                DispatchQueue.main.async { [weak self] in
                    self?.searchResults = coincidences.results
                }
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }

    func fetchByGenre(genre: String, page: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getMoviesByGenre(genre: genre, page: page),
                                 type: MovieListPage.self) { result in
            switch result {
            case .success(let found):
                DispatchQueue.main.async { [weak self] in
                    self?.byGenre = found.results
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
}


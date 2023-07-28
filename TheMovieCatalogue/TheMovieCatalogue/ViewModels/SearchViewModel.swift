//
//  SearchViewModel.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 27/07/23.
//

import Foundation

@MainActor class SearchViewModel: ObservableObject {

    @Published var genres : [Genre] = []

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
}

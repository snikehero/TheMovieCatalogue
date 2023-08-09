//
//  ModularMovieListViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 09/08/23.
//

import Foundation

@MainActor class ModularMovieListViewModel: ObservableObject {
    var title: String = ""
    @Published var movies : [MovieListItem] = []
    var currentPage: Int = 1
    var totalPages: Int = 1
    @Published var state: BrowsingState = .good {
        didSet {
            print("state changed to: \(state)")
        }
    }
    var networkManager: NetworkManager = NetworkManager()
    var endpointBuilder: EndpointBuilder = EndpointBuilder()

    init(title: String) {
        self.title = title
    }

    enum BrowsingState: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }

    func loadMore() {
        if self.currentPage <= self.totalPages {
            fetchSearchList(search: title)
        }
    }

    func fetchSearchList(search: String) {

        // Only load when search term isnt empty
        guard !title.isEmpty else {
            return
        }

        // Only load when you are not already loading
        guard state == .good else {
            return
        }

        state = .isLoading

        networkManager.fetchData(
            endpoint: endpointBuilder.getMovieListBySearch(searchText: title, withPage: currentPage),
            type: MovieListPage.self
        ) { result in
            if let result = result {
                DispatchQueue.main.async { [weak self] in
                    for movie in result.results {
                        self?.movies.append(movie)
                    }
                    self?.totalPages = result.totalPages

                    self?.state = (result.totalPages == self?.currentPage) ? .loadedAll : .good

                    self?.currentPage += 1
                }
            }
        }
    }
}

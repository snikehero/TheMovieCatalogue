//
//  ModularMovieListViewModel.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 09/08/23.
//

import Foundation
import SwiftUI

enum ModularViews {
    case search
    case popular
    case nowPlaying
}

@MainActor class ModularMovieListViewModel: ObservableObject {
    @Published var movies : [MovieListItem] = []
    @Published var state: BrowsingState = .good {
        didSet {
            print("state changed to: \(state)")
        }
    }
    var title: String = ""
    var currentPage: Int = 1
    var totalPages: Int = 1
    var withView: ModularViews
    @ViewBuilder var loadingStateView: some View {
        switch self.state {
        case .good :
            Color.gray
                .onAppear {
                    self.loadMore()
                }
        case .isLoading :
            ProgressView()
        case .loadedAll:
            Text("No more results")
                .foregroundColor(.red)
        case .error(let message):
            Text(message)
        }
    }

    var networkManager: NetworkManager = NetworkManager()
    var endpointBuilder: EndpointBuilder = EndpointBuilder()

    init(title: String, withView: ModularViews) {
        self.title = title
        self.withView = withView
    }

    enum BrowsingState: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }

    func loadMore() {
        if self.currentPage <= self.totalPages {
            let endpoint: URL?
            switch self.withView {
            case .search:
                endpoint = endpointBuilder.getMovieListBySearch(searchText: title,withPage: currentPage)
            case .nowPlaying:
                endpoint = endpointBuilder.getNowPlayingURL(page: currentPage)
            case .popular:
                endpoint = endpointBuilder.getPopularURL(page: currentPage)
            }
            fetchMovieListPage(endpoint: endpoint)
        }
    }

    func fetchMovieListPage(endpoint: URL?) {

        // Only load when search term isnt empty
        // Only load when you are not already loading
        guard !title.isEmpty,
              state == .good
        else {
            return
        }

        state = .isLoading

        networkManager.fetchData(
            endpoint: endpoint,
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

//
//  MovieViewModel.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 26/06/23.
//
import Foundation

@MainActor class MovieDetailsViewModel: ObservableObject {
    @Published var movie: MovieDetails = MovieDetails(id: -1,
                                                      title: "",
                                                      overview: "",
                                                      posterPath: "",
                                                      backdropPath: "",
                                                      runtime: 0,
                                                      releaseDate: "",
                                                      genres: [Genre(id: 0, name: "")]
                                        )
    @Published var errorMessage: String? = nil
    @Published var hasError: Bool = false


    var networkManager = NetworkManager()
    let endpointBuilder = EndpointBuilder()

    func fetchMovie(withId id: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getMovieURL(id: id), type: MovieDetails.self) { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async { [weak self] in
                    var movieTemp = movie
                    if movieTemp.genres.isEmpty {
                        movieTemp.genres = [Genre(id: -1, name: "No Genre")]
                    }
                    self?.movie = movieTemp
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

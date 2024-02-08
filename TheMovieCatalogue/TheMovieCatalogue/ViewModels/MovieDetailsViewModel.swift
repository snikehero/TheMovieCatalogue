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
    private var networkManager = NetworkManager()
    private let endpointBuilder = EndpointBuilder()
    func fetchMovie(withId id: Int) {
        networkManager.fetchData(endpoint: endpointBuilder.getMovieURL(id: id), type: MovieDetails.self) { movie in
            if let movie = movie {
                DispatchQueue.main.async { [weak self] in
                    var movieTemp = movie
                    if movieTemp.genres.isEmpty {
                        movieTemp.genres = [Genre(id: -1, name: "No Genre")]
                    }
                    self?.movie = movieTemp
                }
            }
        }
    }
}

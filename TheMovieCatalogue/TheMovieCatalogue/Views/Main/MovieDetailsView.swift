//
//  MovieDetailsView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 29/06/23.
//

import SwiftUI

struct MovieDetailsView: View {
    @Binding var showingSheet: Bool
    @ObservedObject var movieDetailsViewModel: MovieDetailsViewModel
    var movieId: Int
    var body: some View {
        Group {
            if movieDetailsViewModel.hasError == true {
                ErrorView(errorMessage: movieDetailsViewModel.errorMessage!)
            } else {
                ScrollView {
                    ZStack {
                        VStack {
                            MovieImage(imageURL:  movieDetailsViewModel.movie.backdropString)
                            MovieTitle(text: movieDetailsViewModel.movie.title)
                            MovieSpecs(
                                genre: movieDetailsViewModel.movie.genres[0].name,
                                releaseDate: movieDetailsViewModel.movie.releaseDate,
                                runtime: movieDetailsViewModel.movie.runtime
                            )
                            MovieSynopsis(text: movieDetailsViewModel.movie.overview)
                        }
                    }
                }
            }
        }
        .onAppear {
            movieDetailsViewModel.fetchMovie(withId: movieId)
        }
        .ignoresSafeArea()
    }
}

struct MovieSpecs: View {
    var genre: String
    var releaseDate: String
    var runtime: Int
    var body: some View {
        HStack {
            MovieText(text: genre)
            Spacer()
            MovieText(text: releaseDate)
            Spacer()
            MovieText(text: "\(runtime) min")
        }
        .padding(.init(top: ConstantText.zeroText, leading: ConstantText.leadingText,
                       bottom: ConstantText.zeroText, trailing: ConstantText.trailingText))
        .background(Color(ColorConstant.movieDetailsBackgroundColor))
        .clipShape(Capsule())
        .padding(.horizontal)
    }
}

struct MovieDetailsSection: View {
    @StateObject var movieDetailsViewModel = MovieDetailsViewModel()
    var movieId: Int
    var body: some View {
        VStack {
            MovieImage(imageURL:  movieDetailsViewModel.movie.backdropString)
            MovieTitle(text: movieDetailsViewModel.movie.title)
            MovieSpecs(
                genre: movieDetailsViewModel.movie.genres[0].name,
                releaseDate: movieDetailsViewModel.movie.releaseDate,
                runtime: movieDetailsViewModel.movie.runtime
            )
            MovieSynopsis(text: movieDetailsViewModel.movie.overview)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(showingSheet: .constant(false),
                         movieDetailsViewModel: MovieDetailsViewModel(), movieId: MovieDetails.mock.id)
    }
}

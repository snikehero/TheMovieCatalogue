//
//  MovieDetailsView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 29/06/23.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie = Movie.mock
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack{
                    MovieImage(imageURL:  movie.backdrop )
                    MovieTitle(text: movie.title)
                    MovieSpecs()
                    MovieSynopsis(text: movie.overview)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct MovieSpecs: View {
    var movie: Movie = Movie.mock
    var body: some View {
        HStack{
            MovieText(text: movie.genres[0].name)
            Spacer()
            MovieText(text: movie.releaseDate)
            Spacer()
            MovieText(text: "\(movie.runtime) min")
        }
        .padding(.init(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
}

struct MovieDetails: View {
    var movie: Movie = Movie.mock
    
    var body: some View {
        VStack{
            MovieImage(imageURL:  movie.backdrop )
            MovieTitle(text: movie.title)
            MovieSpecs()
            MovieSynopsis(text: movie.overview)
        }
    }
}


struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}

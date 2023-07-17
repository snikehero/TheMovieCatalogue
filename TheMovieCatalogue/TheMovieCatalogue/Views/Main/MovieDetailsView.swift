//
//  MovieDetailsView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 29/06/23.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var body: some View {
        ScrollView {
            ZStack {
                MovieDetails()
            }
        }
        .ignoresSafeArea()
    }
}

struct favoritesButton: View {
    
    var body: some View {
        Button(action: {
        }) {
            Label("Add To Favorites", systemImage:"heart")
        }
        .frame(width: 300, height: 70)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct MovieTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: 0, leading: 12, bottom: 0, trailing: 12))
            .lineLimit(1)
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
            MovieImage(imageURL:  movie.backdrop ?? "")
            MovieTitle(text: movie.title)
            MovieSpecs()
            MovieSynopsis(text: movie.overview)
        }
    }
}

struct MovieImage: View {
    var imageURL: String
    
    var body: some View {
        AsyncImage(
            url: URL(string: imageURL),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 620)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(width: 400, height: 620)
        .cornerRadius(20)
        .overlay(alignment: .bottom) {
            favoritesButton()
                .padding()
        }
    }
}

struct MovieText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 18, weight:.regular, design: .default))
    }
}

struct MovieSynopsis: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.init(top: 1, leading: 12, bottom: 0, trailing: 12))
            .font(.system(size: 14, weight:.regular, design: .rounded))
            .lineLimit(6)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}

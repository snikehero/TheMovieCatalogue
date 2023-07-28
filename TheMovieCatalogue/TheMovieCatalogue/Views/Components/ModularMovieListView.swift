//
//  ModularMovieListView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 27/07/23.
//

import SwiftUI

struct ModularMovieListView: View {
    @Environment(\.dismiss) var dismiss
    let generalMovieName: String
    let moviesForFill: [MovieListItem]
    let navigationLinkDestintion: AnyView
    var body: some View {
        NavigationStack {
            VStack {
                HorizontalCarrouselView(title: generalMovieName,
                                        newMovies: moviesForFill,
                                        navigationLinkDestination: navigationLinkDestintion)
            }
            Spacer()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                        Text(StringConstant.browseTitle)
                    }
                }
            }
        }
    }
}

struct ModularMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ModularMovieListView(generalMovieName: "General",
                             moviesForFill: MainViewModel.moviesMock,
                             navigationLinkDestintion: AnyView(EmptyView()))
    }
}

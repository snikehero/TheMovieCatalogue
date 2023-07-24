//
//  UserView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.General.spacing) {
                    Color(ColorConstant.backgroundColor)
                        .ignoresSafeArea()
                    HorizontalCarrouselView(title: "Favorites",
                                            newMovies: [MovieListItem.mock],
                                            navigationLinkDestination: AnyView(NewMoviesView()))
                }
                .padding()
                .navigationTitle("User")
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

//
//  ButtonsView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 12/07/23.
//

import SwiftUI

struct PosterButton: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var showingSheet: Bool = false
    
    var body: some View {
        Button(action: { showingSheet.toggle() },
               label: {
            AsyncImage(
                url: URL(string: mainViewModel.randomMovie?.poster ?? "0"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ButtonsConstants.posterButtonWidth, height: ButtonsConstants.buttonsHeight)
                        .clipShape(RoundedRectangle(cornerRadius: ButtonsConstants.buttonsCornerRadius))
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: ButtonsConstants.buttonsWeight, height: ButtonsConstants.buttonsHeight)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: ButtonsConstants.buttonsCornerRadius))
        })
        .sheet(isPresented: $showingSheet) {
            MovieDetailsView()
        }
    }
}

struct favoritesButton: View {
    
    var body: some View {
        Button(action: {
        }) {
            Label(ButtonsConstants.addToFavorites, systemImage:"heart")
        }
        .frame(width: ButtonsConstants.buttonsWeight, height: ButtonsConstants.favoritesButtonHeigth)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: ButtonsConstants.buttonsCornerRadius))
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
      Text("ButtondView")
    }
}

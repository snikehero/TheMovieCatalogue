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
                        .frame(width: ButtonsConstant.posterButtonWidth, height: ButtonsConstant.buttonsHeight)
                        .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: ButtonsConstant.buttonsWeight, height: ButtonsConstant.buttonsHeight)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
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
            Label(ButtonsConstant.addToFavorites, systemImage:"heart")
        }
        .frame(width: ButtonsConstant.buttonsWeight, height: ButtonsConstant.favoritesButtonHeigth)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
      Text("ButtondView")
    }
}
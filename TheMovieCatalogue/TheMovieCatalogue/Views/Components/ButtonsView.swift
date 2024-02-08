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
        Button(action: { mainViewModel.showingSheet = true },
               label: {
            AsyncImage(
                url: URL(string: mainViewModel.randomMovie?.posterString ?? "0"),
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
        }
    }

struct LandscapePosterButton: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var showingSheet: Bool = false
    var body: some View {
        Button(action: { mainViewModel.showingSheet = true },
               label: {
            AsyncImage(url: URL(string: mainViewModel.posterString),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: LandscapeConstant.LandcapePosterButtonWidth,
                   height: LandscapeConstant.LandcapePosterButtonHeight)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
        })
    }
}

struct FavoritesButton: View {
    var body: some View {
        Button(action: { },
               label: {
            Image(systemName: "heart.fill")
        })
        .frame(width: ButtonsConstant.buttonsWeight, height: ButtonsConstant.favoritesButtonHeigth)
        .background(Color(ColorConstant.favoritesColorButton)
        .clipShape(Circle()))
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("ButtondView")
    }
}

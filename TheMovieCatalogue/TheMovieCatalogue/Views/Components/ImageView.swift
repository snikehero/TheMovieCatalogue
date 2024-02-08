//
//  ImageView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 12/07/23.
//

import SwiftUI

struct MovieImage: View {
    var imageURL: String
    var body: some View {
        AsyncImage(
            url: URL(string: imageURL),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: PosterImage.imageWidth, height: PosterImage.imageHeight)
                    .clipShape(RoundedRectangle(cornerRadius: PosterImage.imagerCornerRadius))
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(width: PosterImage.imageWidth, height: PosterImage.imageHeight)
        .cornerRadius(PosterImage.imagerCornerRadius)
        .overlay(alignment: .bottom) {
            FavoritesButton()
                .padding()
        }
    }
}
struct NoNetworkImage: View {
    var body: some View {
        Image(systemName: NoNetwork.noNetworkString)
            .foregroundColor(Color(.black))
            .font(.system(size: NoNetwork.networkImageSystemSyze))
            .padding()
    }
}
struct DescriptionNoNetworkImage: View {
    var body: some View {
        Image("NoNetworkImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Image View")
    }
}

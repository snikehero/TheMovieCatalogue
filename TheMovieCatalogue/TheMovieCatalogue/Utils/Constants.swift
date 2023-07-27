//
//  Numbers.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 06/07/23.
//

import Foundation
import SwiftUI

enum Constants {
  enum CarrouselImages {
    public static let width = CGFloat(100.0)
    public static let height = CGFloat(150.0)
    public static let spacing = CGFloat(20.0)
    public static let cornerRadius = CGFloat(20.0)
  }
  enum General {
    public static let spacing = CGFloat(20.0)
  }
}

enum ConstantText {
    public static let specSize = CGFloat(18)
    public static let leadingText = CGFloat(12)
    public static let trailingText = CGFloat(12)
    public static let synopsisSize =  CGFloat(14)
    public static let widthID = CGFloat(268)
    public static let topSynopsis = CGFloat(1)
    public static let zeroText = CGFloat(0)
    public static let lineLimitSynopsis = 6
    public static let lineLimitTitle = 1
}

enum PosterImage {
    public static let imageWidth = CGFloat(400)
    public static let imageHeight = CGFloat(620)
    public static let imagerCornerRadius = CGFloat(20)
}

enum ButtonsConstant {
    public static let buttonsWeight = CGFloat(300)
    public static let buttonsCornerRadius = CGFloat(20)
    public static let buttonsHeight = CGFloat(460)
    public static let posterButtonWidth = CGFloat(350)
    public static let favoritesButtonHeigth = CGFloat(70)
    public static let addToFavorites = "Add to Favorites"
}

enum StringConstant {
    public static let mainTittle = "Movie"
    public static let recomendedMovie = "Recomended Movie"
    public static let browseTitle = "Browse"
    public static let promptSearch = "Search movie"
}

enum ColorConstant {
    public static let movieDetailsBackgroundColor = "MovieDetailsBackgroundColor"
    public static let backgroundColor = "BackgroundColor"
    public static let gradientColor = "GradientColor"
}

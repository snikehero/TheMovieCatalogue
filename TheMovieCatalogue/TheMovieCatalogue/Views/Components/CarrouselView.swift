//
//  CarrouselView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 06/07/23.
//

import SwiftUI

struct CarrouselView: View {
  let colors1: [Color] = [.blue, .red, .green, .orange, .yellow]
  let colors2: [Color] = [.black]
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: Constants.General.spacing) {
          HorizontalCarrouselView(colors: colors1, title: "New Movies >", navigationLinkDestination: AnyView(NewMoviesView()))
          Spacer()
        }
        .padding()
      }
    }
  }
}

private struct HorizontalCarrouselView: View {
  let colors: [Color]
  let title: String
  let navigationLinkDestination: AnyView
  
  var body: some View {
    VStack(alignment: .leading,spacing: Constants.CarrouselImages.spacing) {
      NavigationLink {
        navigationLinkDestination
      } label: {
        Text(title)
          .font(.system(.title2, design: .rounded))
          .accentColor(.primary)
      }
      ScrollView(.horizontal) {
        HStack(spacing: Constants.CarrouselImages.spacing) {
          ForEach(colors, id: \.self) { color in
            NavigationLink {
              EmptyView()
            } label: {
              Image("Batman")
                .resizable()
                .frame(width: Constants.CarrouselImages.width, height: Constants.CarrouselImages.height)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: Constants.CarrouselImages.cornerRadius))
            }
          }
        }
      }
    }
  }
}


struct CarrouselView_Previews: PreviewProvider {
  static var previews: some View {
    CarrouselView()
  }
}

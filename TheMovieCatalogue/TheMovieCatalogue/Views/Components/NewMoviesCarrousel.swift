//
//  NewMovieCarrousel.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 29/06/23.
//

import SwiftUI

struct NewMoviesCarrousel: View {
  //Recibe PopularMovies
  var body: some View {
    VStack {
      HStack {
        NavigationLink {
          NewMoviesView()
        }
      label: {
        Text("New Movies >")
          .padding(.horizontal)
          .font(.system(.title3, design: .rounded))
      }
        Spacer()
      }
      ScrollView {
        ScrollView(.horizontal) {
          HStack(spacing: 16) {
            ForEach(0..<10) { num in
              GeometryReader { proxy in
                let scale = getScale(proxy: proxy)
                Button {
                  
                } label: {
                  Image("Batman")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                    .scaleEffect(CGSize(width: scale, height: scale))
                }
              }
              .frame(width: 100, height: 150)
            }
          }
          .padding(32)
        }
      }
    }
  }
  private func getScale(proxy: GeometryProxy) -> CGFloat {
    var scale: CGFloat = 1
    let x = proxy.frame(in: .global).minX
    let diff = abs(x)
    if diff < 100 {
      scale = 1 + diff / 500
    }
    return scale
  }
}

struct NewMovieCarrousel_Previews: PreviewProvider {
  static var previews: some View {
    NewMoviesCarrousel()
  }
}

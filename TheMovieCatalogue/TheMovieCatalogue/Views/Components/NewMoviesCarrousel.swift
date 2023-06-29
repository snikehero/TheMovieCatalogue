//
//  NewMovieCarrousel.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 29/06/23.
//

import SwiftUI

struct NewMoviesCarrousel: View {
    var body: some View {
      VStack {
        HStack {
          Text("New Movies")
            .padding(.horizontal)
            .font(.system(.title3, design: .rounded))
            
            Spacer()
          
        }
      }
    }
}

struct NewMovieCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        NewMoviesCarrousel()
    }
}

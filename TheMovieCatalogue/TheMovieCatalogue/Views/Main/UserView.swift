//
//  UserView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct UserView: View {
  var body: some View {
    ZStack {
      Color.blue
      Text("UserView")
        .navigationTitle("User")
    }
  }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

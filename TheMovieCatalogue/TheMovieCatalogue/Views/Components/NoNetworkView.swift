//
//  NoNetworkView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 02/08/23.
//

import SwiftUI

struct NoNetworkView: View {
  var body: some View {
      VStack {
       NoNetworkImage()
          NoNetworkTitle(text: NoNetwork.noNetworkTitle)
          NoNetworkDescription(text: NoNetwork.noNetworkDescription)
          .multilineTextAlignment(.center)
          DescriptionNoNetworkImage()
    }
      .padding(.init(top: NoNetwork.noNetworkTopPading,
                     leading: NoNetwork.noNetworkLeading,
                     bottom: NoNetwork.noNetworkBottomPading,
                     trailing: NoNetwork.noNetworkTrailing))
  }
}
struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}

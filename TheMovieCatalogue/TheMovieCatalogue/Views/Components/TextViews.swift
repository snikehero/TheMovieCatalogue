//
//  TextViews.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 12/07/23.
//

import SwiftUI

struct MovieText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontDesign(.default)
            .background(Color(Colors.movieDetailsBackgroundColor))
    }
}

struct RecomendedMovie: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    var body: some View {
        VStack {
            HStack {
                Text(StringConstants.recomendedMovie)
                    .padding(.horizontal)
                    .font(.title3)
                    .fontDesign(.rounded)
                Spacer()
            }
            PosterButton()
                .padding(.bottom)
        }
        .onAppear{
            mainViewModel.fetchMovie(withId: Int(Texts.widthID))
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors:[Color(Colors.backgroundColor), Color(Colors.gradientColor)],startPoint: .top, endPoint: .bottom))
    }
}

struct MovieSynopsis: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.init(top: Texts.topSynopsis, leading: Texts.leadingText, bottom: Texts.zeroText, trailing: Texts.trailingText))
            .font(.footnote)
            .fontDesign(.rounded)
            .lineLimit(Texts.lineLimitSynopsis)
    }
}

struct MovieTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: Texts.zeroText, leading: Texts.leadingText, bottom: Texts.zeroText, trailing: Texts.trailingText))
            .lineLimit(Texts.lineLimitTitle)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Text("TextViews")
    }
}

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
            .background(Color(ColorConstant.movieDetailsBackgroundColor))
    }
}

struct RecomendedMovie: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(StringConstant.recomendedMovie)
                    .padding(.horizontal)
                    .font(.title3)
                    .fontDesign(.rounded)
                Spacer()
            }
            PosterButton()
                .padding(.bottom)
        }
        .onAppear{
            mainViewModel.fetchTopRated()
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors:[Color(ColorConstant.backgroundColor), Color(ColorConstant.gradientColor)],startPoint: .top, endPoint: .bottom))
    }
}

struct MovieSynopsis: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.init(top: ConstantText.topSynopsis, leading: ConstantText.leadingText, bottom: ConstantText.zeroText, trailing: ConstantText.trailingText))
            .font(.footnote)
            .fontDesign(.rounded)
            .lineLimit(ConstantText.lineLimitSynopsis)
    }
}

struct MovieTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: ConstantText.zeroText, leading: ConstantText.leadingText, bottom: ConstantText.zeroText, trailing: ConstantText.trailingText))
            .lineLimit(ConstantText.lineLimitTitle)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Text("TextViews")
    }
}

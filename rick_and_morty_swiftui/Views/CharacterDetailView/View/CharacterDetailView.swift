//
//  CharacterDetailView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 18/10/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterDetailView<T>: View where T: CharacterDetailViewRepresentable {
    @ObservedObject var viewModel: T
    
    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: URL(string: viewModel.character?.image ?? ""))
                    .resizable()
                    .placeholder(Image("icon"))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
                Text(viewModel.character?.name ?? "")
                
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 20)
            .background(Color.clear)
        }
        .padding([.top, .bottom], 0.5)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}


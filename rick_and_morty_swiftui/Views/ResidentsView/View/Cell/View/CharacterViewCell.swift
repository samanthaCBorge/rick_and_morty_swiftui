//
//  CharacterViewCell.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterViewCell<T>: View where T: CharacterCellViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        HStack(spacing: 18) {
            WebImage(url: URL(string: viewModel.character?.image ?? ""))
                .resizable()
                .placeholder(Image("icon"))
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            VStack(alignment: .leading, spacing: 6) {
                Text(viewModel.character?.name ?? "")
                    .fontWeight(.semibold)
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

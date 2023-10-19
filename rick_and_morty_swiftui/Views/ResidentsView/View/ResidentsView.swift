//
//  CharactersView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct ResidentsView<T>: View where T: ResidentsViewModelRepresentable {
    @ObservedObject var viewModel: T
    
    var body: some View {
        List(viewModel.residents, id: \.self) { url in
            let characterViewModel = CharacterCellViewModel(residentURL: url)
            CharacterViewCell(viewModel: characterViewModel)
                .contentShape(.rect)
                .onTapGesture {
                    if let character = characterViewModel.character {
                        viewModel.goToCharacter(character: character)
                    }
                }
        }
        .navigationTitle("Residents")
    }
}


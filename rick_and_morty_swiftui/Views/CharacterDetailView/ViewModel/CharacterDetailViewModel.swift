//
//  CharacterDetailViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 18/10/23.
//

import UIKit
import Combine

protocol CharacterDetailViewRepresentable: ObservableObject {
    var character: CharacterInfo? { get set }

 
}

final class CharacterDetailViewModel<R: AppRouter> {
    var router: R?


    private var cancellables = Set<AnyCancellable>()

    @Published var character: CharacterInfo?
    

}

extension CharacterDetailViewModel: CharacterDetailViewRepresentable {
    
 
}


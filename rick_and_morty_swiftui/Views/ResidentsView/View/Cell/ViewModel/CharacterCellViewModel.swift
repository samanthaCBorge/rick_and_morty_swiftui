//
//  CharacterCellViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import UIKit
import Combine

protocol CharacterCellViewModelRepresentable: ObservableObject {
    var character: CharacterInfo? { get set }
    func loadData()
}

final class CharacterCellViewModel {

    private var cancellables = Set<AnyCancellable>()
    @Published var character: CharacterInfo?
    
    private let store: ResidentListStore
    private let residentURL: String
    
    init(residentURL: String, store: ResidentListStore = APIManager()) {
        self.store = store
        self.residentURL = residentURL
    }
}

extension CharacterCellViewModel: CharacterCellViewModelRepresentable {
    
    func loadData() {
        let recieved = { (response: CharacterInfo) -> Void in
            DispatchQueue.main.async { [unowned self] in
                character = response
            }
        }
        
        let completion = { (completion: Subscribers.Completion<Failure>) -> Void in
            switch  completion {
            case .finished:
                break
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        store.readResidents(url: residentURL)
            .sink(receiveCompletion: completion, receiveValue: recieved)
            .store(in: &cancellables)
    }
}

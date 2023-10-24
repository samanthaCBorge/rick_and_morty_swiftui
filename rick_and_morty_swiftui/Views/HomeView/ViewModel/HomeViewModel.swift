//
//  HomeViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import UIKit
import Combine

protocol HomeViewModelRepresentable: ObservableObject {
    var location: [Location] { get set }
    func loadData()
    func goToCharacter(residents: [String])
    func exit()
}

final class HomeViewModel<R: AppRouter> {
    var router: R?
    
    @Published var location = [Location]()
    private var cancellables = Set<AnyCancellable>()
    private let store: HomeListStore
    
    init(store: HomeListStore = APIManager()) {
        self.store = store
    }
}

extension HomeViewModel: HomeViewModelRepresentable {
    
    func exit() {
        router?.exit()
    }
    
    func loadData() {
        let recieved = { (response: LocationResponse) -> Void in
            DispatchQueue.main.async { [unowned self] in
                location = response.results
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
        
        store.readLocationList()
            .sink(receiveCompletion: completion, receiveValue: recieved)
            .store(in: &cancellables)
    }
    
    func goToCharacter(residents: [String]) {
        router?.process(route: .showCharacters(residents: residents))
    }
}

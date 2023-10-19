//
//  CharactersViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import UIKit
import Combine

protocol ResidentsViewModelRepresentable: ObservableObject {
    var residents: [String] { get set }
    var selectedCharacter: CharacterInfo? { get set }
    var characterListSubject: PassthroughSubject<[String], Failure> { get }
    func loadData()
    func goToCharacter(character: CharacterInfo)
}

final class ResidentsViewModel<R: AppRouter> {
    var router: R?

    let characterListSubject = PassthroughSubject<[String] , Failure>()
    private var cancellables = Set<AnyCancellable>()
    @Published var residents = [String]()
    @Published var locationUrl: Location?
    @Published var selectedCharacter: CharacterInfo?
    private let store: ResidentListStore
    
    init(residents: [String], store: ResidentListStore = APIManager()) {
        self.store = store
        self.residents = residents
    }
}

extension ResidentsViewModel: ResidentsViewModelRepresentable {
    
    func loadData() {
        let recieved = { (response: CharacterInfo) -> Void in
            DispatchQueue.main.async { [unowned self] in
                characterListSubject.send(response.location.residents ?? [])
            }
        }
        
        let completion = { [unowned self] (completion: Subscribers.Completion<Failure>) -> Void in
            switch  completion {
            case .finished:
                break
            case .failure(let failure):
                characterListSubject.send(completion: .failure(failure))
            }
        }
        
        store.readResidents(url: locationUrl?.url ?? "")
            .sink(receiveCompletion: completion, receiveValue: recieved)
            .store(in: &cancellables)
    }
    
    func goToCharacter(character: CharacterInfo) {
        router?.process(route: .showCharacterDetail(character: character))
    }
}


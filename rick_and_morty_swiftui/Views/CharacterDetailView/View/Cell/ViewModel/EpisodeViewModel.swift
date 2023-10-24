//
//  EpisodeViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 23/10/23.
//

import UIKit
import Combine

protocol EpisodeViewModelRepresentable: ObservableObject {
    var episode: Episode? { get set }
    func loadData()
}

final class EpisodeViewModel {

    private var cancellables = Set<AnyCancellable>()
    @Published var episode: Episode?
    
    private let store: EpisodeListStore
    private let episodeURL: String?
    
    init(episodeURL: String, store: EpisodeListStore = APIManager()) {
        self.store = store
        self.episodeURL = episodeURL
    }
}

extension EpisodeViewModel: EpisodeViewModelRepresentable {
    
    func loadData() {
        let recieved = { (response: Episode) -> Void in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                episode = response
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
        
        store.readEpisodes(url: episodeURL ?? "")
            .sink(receiveCompletion: completion, receiveValue: recieved)
            .store(in: &cancellables)
    }
}


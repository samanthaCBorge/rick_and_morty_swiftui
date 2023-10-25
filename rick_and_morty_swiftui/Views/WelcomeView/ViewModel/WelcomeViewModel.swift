//
//  WelcomeViewModel.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 25/10/23.
//

import Foundation

protocol WelcomeViewModelRepresentable: ObservableObject {
    var isAnimating: Bool { get set }
    func goToHome()
}

final class WelcomeViewModel<R: AppRouter> {
    var router: R?
    
    @Published var isAnimating = true
}

extension WelcomeViewModel: WelcomeViewModelRepresentable {
    func goToHome() {
        router?.process(route: .showHome)
    }
}

//
//  CharacterDetailCoordinator.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 18/10/23.
//

import UIKit
import SwiftUI

final class CharacterDetailCoordinator<R: AppRouter> {
    let router: R
    var character: CharacterInfo
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = CharacterDetailViewModel<R>()
        viewModel.router = router
        viewModel.character = character
        let viewController = UIHostingController(rootView: CharacterDetailView(viewModel: viewModel))
        return viewController
    }()
    
    init(character: CharacterInfo, router: R) {
        self.router = router
        self.character = character
    }
}

extension CharacterDetailCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}

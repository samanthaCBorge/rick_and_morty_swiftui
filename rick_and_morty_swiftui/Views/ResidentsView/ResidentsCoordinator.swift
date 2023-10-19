//
//  CharactersCoordinator.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import UIKit
import SwiftUI

final class ResidentsCoordinator<R: AppRouter> {
    let router: R
    var residents: [String]
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = ResidentsViewModel<R>(residents: residents)
        viewModel.router = router
        viewModel.residents = residents
        let viewController = UIHostingController(rootView: ResidentsView(viewModel: viewModel))
        return viewController
    }()
    
    init(residents: [String], router: R) {
        self.router = router
        self.residents = residents
    }
}

extension ResidentsCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}

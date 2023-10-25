//
//  HomeCoordinator.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import UIKit
import SwiftUI

final class HomeCoordinator<R: AppRouter> {
    let router: R
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = HomeViewModel<R>()
        viewModel.router = router
        let viewController = UIHostingController(rootView: HomeView(viewModel: viewModel))
        return viewController
    }()
    
    init(router: R) {
        self.router = router
    }
}

extension HomeCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}


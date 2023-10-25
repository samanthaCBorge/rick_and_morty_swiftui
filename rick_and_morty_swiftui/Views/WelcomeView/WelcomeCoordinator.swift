//
//  WelcomeCoordinator.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 25/10/23.
//

import UIKit
import SwiftUI

final class WelcomeCoordinator<R: AppRouter> {
    let router: R
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = WelcomeViewModel<R>()
        viewModel.router = router
        let viewController = UIHostingController(rootView: WelcomeView(viewModel: viewModel))
        return viewController
    }()
    
    init(router: R) {
        self.router = router
    }
}

extension WelcomeCoordinator: Coordinator {
    func start() {
        if router.navigationController.viewControllers.isEmpty {
            router.navigationController.pushViewController(primaryViewController, animated: true)
        } else {
            router.navigationController.viewControllers.removeAll()
            router.navigationController.pushViewController(primaryViewController, animated: true)
        }
    }
}


//
//  App.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import UIKit

final class App {
    var navigationController = UINavigationController()
    private var coordinatorRegister: [AppTransition: Coordinator] = [:]
}

extension App: Coordinator {
    func start() {
        process(route:  .showHome)
    }
}

extension App: AppRouter {
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
        process(route: .showHome)
    }
    
    func process(route: AppTransition) {
        print("Processing route: \(route)")
        let coordinator = route.hasState ? coordinatorRegister[route] : route.coordinatorFor(router: self)
        coordinator?.start()
    }
}

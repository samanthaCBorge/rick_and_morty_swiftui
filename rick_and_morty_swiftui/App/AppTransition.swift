//
//  AppTransition.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import Foundation

enum AppTransition {
    
    case showWelcome
    case showHome
    case showCharacters(residents: [String])
    case showCharacterDetail(character: CharacterInfo)
    
    var hasState: Bool {
        false
    }
    
    func coordinatorFor<R: AppRouter>(router: R) -> Coordinator {
        switch self {
        case .showWelcome: return WelcomeCoordinator(router: router)
        case .showHome: return HomeCoordinator(router: router)
        case .showCharacters(let residents): return ResidentsCoordinator(residents: residents, router: router)
        case .showCharacterDetail(let character): return CharacterDetailCoordinator(character: character, router: router)
        }
    }
}

extension AppTransition: Hashable {
    
    var identifier: String {
        switch self {
        case .showWelcome: return "showWelcome"
        case .showHome: return "showHome"
        case .showCharacters: return "showCharacters"
        case .showCharacterDetail: return "showCharacterDetail"
        }
    }
    
    static func == (lhs: AppTransition, rhs: AppTransition) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

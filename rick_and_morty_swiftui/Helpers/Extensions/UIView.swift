//
//  UIView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 19/10/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


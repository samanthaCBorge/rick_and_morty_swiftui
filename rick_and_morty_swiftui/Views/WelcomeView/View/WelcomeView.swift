//
//  WelcomeView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 24/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct WelcomeView<T>: View where T: WelcomeViewModelRepresentable {
    @ObservedObject var viewModel: T
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            AnimatedImage(name: "icegif-519.gif", isAnimating: $viewModel.isAnimating)
                .padding([.top, .bottom], 90)
            
            Button {
                viewModel.goToHome()
            } label: {
                Image("weapon")
                    .resizable()
                    .scaledToFill()
                    .shadow(color: .darkGreen, radius: 2, x: 0, y: 0)
                    .padding(14)
                    .frame(width: 70, height: 70)
                    .background(Color.lightGray)
                    .clipShape(Circle())
            }
            .shadow(color: .green, radius: 4, x: 0, y: 0)
            .padding(.bottom, 40)
        }
        .background(Color.darkGray.edgesIgnoringSafeArea(.all))
        .onDisappear {
            viewModel.isAnimating = false
        }
    }
}


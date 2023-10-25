//
//  HomeView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import SwiftUI

struct HomeView<T>: View where T: HomeViewModelRepresentable {
    @ObservedObject var viewModel: T
    
    var body: some View {
        VStack {
            Text("Locations")
                .font(.system(size: 22, weight: .semibold, design: .monospaced))
                .foregroundStyle(.white)
                .padding()
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.location, id: \.id) { location in
                        VStack {
                            Text(location.name ?? "")
                                .font(.system(size: 18, weight: .medium, design: .monospaced))
                                .padding(.all)
                        }
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(.thinMaterial)
                        .cornerRadius(15, corners: .allCorners)
                        .shadow(radius: 5, x: 0, y: 2)
                        .padding(.all)
                        .scrollTransition(.animated.threshold(.visible(0.3))) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.3)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.3)
                        }
                        .onTapGesture {
                            viewModel.goToCharacter(residents: location.residents ?? [])
                        }
                    }
                }
                .onAppear {
                    viewModel.loadData()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .background(
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}



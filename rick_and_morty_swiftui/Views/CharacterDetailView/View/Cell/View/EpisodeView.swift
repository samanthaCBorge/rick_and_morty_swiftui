//
//  EpisodeView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 23/10/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct EpisodeView<T>: View where T: EpisodeViewModelRepresentable {
    @ObservedObject var viewModel: T
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack {
                Text(viewModel.episode?.name ?? "")
                    .font(.callout)
                    .foregroundStyle(.black)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(5)
            }
            .background(Color.lightGray)
            .cornerRadius(4, corners: .allCorners)
            .frame(width: 220, alignment: .leading)
            
            HStack {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.lightGray)
                    .frame(width: 72, height: 28)
                    .overlay(Text("Episode")
                        .fontWeight(.regular)
                        .foregroundStyle(.black))
                
                Text(viewModel.episode?.episode ?? "")
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.lightGray)
                    .frame(width: 72, height: 28)
                    .overlay(Text("Air Date")
                        .fontWeight(.regular)
                        .foregroundStyle(.black))
                
                Text(viewModel.episode?.airDate ?? "")
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .onAppear {
            viewModel.loadData()
        }
    }
}

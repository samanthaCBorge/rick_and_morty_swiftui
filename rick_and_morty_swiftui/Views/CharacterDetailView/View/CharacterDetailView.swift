//
//  CharacterDetailView.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 18/10/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterDetailView<T>: View where T: CharacterDetailViewRepresentable {
    @ObservedObject var viewModel: T
    
    var body: some View {
        ScrollView {
            ZStack {
                WebImage(url: URL(string: viewModel.character?.image ?? ""))
                    .resizable()
                    .placeholder(Image("icon"))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), Color(viewModel.character?.statusMember ?? .gray), Color(viewModel.character?.statusMember ?? .gray), .black.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                            .mask {
                                Circle()
                                    .stroke(lineWidth: 12)
                            }
                    }
    
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(viewModel.character?.statusMember ?? .gray)
                    .frame(width: 76, height: 36)
                    .overlay(Text(viewModel.character?.status ?? "")
                        .foregroundStyle(.white))
                    .padding(.top, 190)
            }
            .padding(.top, 20)
            .background(Color.clear)
            
            ZStack {
                HStack(alignment: .firstTextBaseline, spacing: 28) {
                    VStack(alignment: .leading) {
                        Label {
                            Text("Specie")
                                .fontWeight(.semibold)
                        } icon: {
                            Image("adn")
                                .foregroundStyle(.white)
                        }
                        Label {
                            Text("Gender")
                                .fontWeight(.semibold)
                        } icon: {
                            Image("gender")
                                .foregroundStyle(.white)
                        }
                        Label {
                            Text("Status")
                                .fontWeight(.semibold)
                        } icon: {
                            Image("green")
                                .foregroundStyle(viewModel.character?.statusMember ?? .gray)
                        }
                    }
                    .foregroundStyle(.white)
                    
                    VStack(alignment: .leading, spacing: 14)  {
                        Text(viewModel.character?.species ?? "")
                            .fontWeight(.regular)
                        Text(viewModel.character?.gender ?? "")
                            .fontWeight(.regular)
                        Text(viewModel.character?.status ?? "")
                            .fontWeight(.regular)
                    }
                    .foregroundStyle(.white)
                    
                }
                .padding()
                .frame(width: 256, height: 200, alignment: .center)
                .background(Color.black)
                .cornerRadius(18, corners: .allCorners)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), Color.verdigris]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(145))
                        .mask {
                            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .stroke(lineWidth: 7)
                                .frame(width: 256, height: 200)
                        }
                )
                .padding(.top, 80)
                
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(Color.turquoise)
                    .frame(width: 60, height: 28)
                    .overlay(Text("Info")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 0))
                    .padding(.vertical, -70)
                    .padding(.horizontal, -84)
            }
            
            ScrollView(.horizontal) {
               HStack {
                    ForEach(viewModel.character?.episode ?? [], id: \.self) { url in
                        let episodeViewModel = EpisodeViewModel(episodeURL: url)
                        EpisodeView(viewModel: episodeViewModel)
                    }
                    .background(Color.darkGreen.opacity(0.4))
                    .cornerRadius(15, corners: .allCorners)
                }
                .padding()
            }
            .padding(.top, 40)
        }
        .padding([.top, .bottom], 0.5)
        .navigationTitle(viewModel.character?.name ?? "")
        .background(
            Image("stars")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}


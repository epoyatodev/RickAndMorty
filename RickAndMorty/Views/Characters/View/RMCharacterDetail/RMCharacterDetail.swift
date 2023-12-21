//
//  RMCharacterDetail.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct RMCharacterDetail: View {
    @ObservedObject var viewModel: RMCharactersViewModel
    var character: RMCharacterModel
    var body: some View {
        VStack {
            CachedAsyncImage(url: URL(string: character.image), urlCache: .imageCache) { rmImage in
                rmImage
                    .resizable()
                    .clipShape(Ellipse())
                    .frame(width: 150, height: 150)
                
                
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .clipShape(Ellipse())
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.gray)
            }
            
            Text(character.name)
                .font(.title2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Informations")
                        .foregroundStyle(.secondary)
                        .fontWeight(.heavy)
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading){
                            Text("Gender")
                                .font(.callout.weight(.semibold))
                            Text(character.gender)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(height: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        VStack(alignment: .leading){
                            Text("Status")
                                .font(.callout.weight(.semibold))
                            Text(character.status.rawValue)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(height: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        VStack(alignment: .leading){
                            Text("Specie")
                                .font(.callout.weight(.semibold))
                            Text(character.species)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(height: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        VStack(alignment: .leading){
                            Text("Origin")
                                .font(.callout.weight(.semibold))
                            Text(character.origin.name)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(height: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        VStack(alignment: .leading){
                            Text("Type")
                                .font(.callout.weight(.semibold))
                            Text(character.type.isEmpty ? "Unknown" : character.type)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(height: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        Text(viewModel.rmLocation?.name ?? "")
                        
                        VStack(alignment: .leading){
                            Text("Location")
                                .font(.callout.weight(.semibold))
                            Text(character.location.name)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 60)
                        
                    }
                    .padding(.leading)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Episodes")
                        .foregroundStyle(.secondary)
                        .fontWeight(.heavy)
                    VStack {
                        ForEach(viewModel.rmEpisodes){ episode in
                            RMEpisodeCard(episode: episode)
                        }
                    }
                }
                .padding(.horizontal)
                
            }
            .tint(.primary)
            
            
        }
        .toolbarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.fetchEpisode(idEpisodes: viewModel.extractLastNumber(from: character.episode))
        }
        
    }
}

#Preview {
    NavigationStack {
        RMCharacterDetail(viewModel: .init(), character: .characterPreview)
    }
}


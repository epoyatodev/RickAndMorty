//
//  RMLocationCard.swift
//  RickAndMorty
//
//  Created by Enrique Poyato Ortiz on 18/11/23.
//

import SwiftUI

struct RMEpisodeCard: View {
    var episode: RMEpisodeModel
    var body: some View {
        
        HStack {
            VStack(alignment: .leading){
                Text(episode.episode)
                    .font(.callout.weight(.semibold))
                Text(episode.name)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Divider()
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .frame(height: 60)
        .padding(.leading)

        
        
        
    }
}

#Preview {
    RMEpisodeCard(episode: .episodePreview)
        .padding()
}

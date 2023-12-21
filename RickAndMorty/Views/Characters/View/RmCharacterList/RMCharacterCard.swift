//
//  RMCharacterCard.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct RMCharacterCard: View {
    var character: RMCharacterModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            CachedAsyncImage(url: URL(string: character.image), urlCache: .imageCache) { rmImage in
                rmImage
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(character.name)
                        .font(.footnote.bold())
                        .lineLimit(1)
                    Text(character.species)
                        .font(.caption)
                        .lineLimit(1)
                }
                .foregroundStyle(.primary)

                Spacer()
                VStack {
                    Image(systemName: character.status == .alive ? "circle.fill" : character.status == .unknown ? "xmark.circle" : "circle")
                        .foregroundStyle(character.status == .alive ? .green : .red)
                        .font(.footnote)
                    Text(character.status.rawValue)
                        .font(.caption)
                }
                .foregroundStyle(.primary)

                
            }
            .padding()
            .background(.white)
        }
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 3, x: 3, y: 3)
    }
}

#Preview {
    RMCharacterCard(character: .characterPreview)
        .padding()
}

//
//  RMCharactersView.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI

struct RMCharactersView: View {
    @StateObject var viewModel = RMCharactersViewModel()
    var body: some View {
        
        switch viewModel.status {
        case .loading:
            Text("Loading...")
        case .loaded:
            RMListCharacters(viewModel: viewModel)
        case .error(error: let error):
            Text(error)
        } 
    }
}


#Preview {
    RMCharactersView()
}

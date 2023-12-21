//
//  FilterView.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedStatus: String
    @Binding var selectedSpecies: String
    @Binding var isPresented: Bool
    var viewModel: RMCharactersViewModel
    
    let optionStatus = ["None", "Alive", "Dead", "Unknown"]
    let optionSpecies = ["None", "Human", "Alien", "Mythological"]
    
    var body: some View {
        VStack {
            Text("Filters")
                .font(.title2)
            CustomPicker(selectedOption: $selectedStatus, options: optionStatus, title: "Status")
            CustomPicker(selectedOption: $selectedSpecies, options: optionSpecies, title: "Species")

            
            HStack {
                Button {
                    viewModel.fetchAllCharacters(status: selectedStatus == "None" ? "" : selectedStatus.lowercased(), species: selectedSpecies == "None" ? "" : selectedSpecies.lowercased())
                    viewModel.page = 1
                    isPresented.toggle()
                } label: {
                    Text("Filter")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue.opacity(0.3))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
                .foregroundStyle(.blue)
                
                Button {
                    selectedSpecies = "None"
                    selectedStatus = "None"
                    viewModel.page = 1

                }label: {
                    Text("Clean Filters")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red.opacity(0.3))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
                .foregroundStyle(.red)

            }


            
        }
        .frame(maxHeight: .infinity)
        .background(.ultraThinMaterial)
        .presentationDetents([.height(200)])
        .presentationCornerRadius(20)
    }
}

#Preview {
    FilterView(selectedStatus: .constant(""), selectedSpecies: .constant(""), isPresented: .constant(false), viewModel: .init())
}

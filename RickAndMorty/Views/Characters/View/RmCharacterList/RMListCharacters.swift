//
//  RMListCharacters.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI

struct RMListCharacters: View {
    @ObservedObject var viewModel: RMCharactersViewModel
    @State private var isPresented: Bool = false
    @State private var searchText: String = ""
    @State private var selectedStatus = ""
    @State private var selectedSpecies = ""
    @State private var scrollOffset: CGFloat = 0
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width, maximum: UIScreen.main.bounds.width)), GridItem(.adaptive(minimum: UIScreen.main.bounds.width, maximum: UIScreen.main.bounds.width))]
    
    var body: some View {
        
        NavigationStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    HStack(spacing: 0) {
                        CustomSearch(searchText: $searchText)
                            .id(1)

                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                        }
                        .foregroundStyle(.blue)
                        .padding(.trailing)
                    }
                    
                    if !viewModel.msgErrorFilter.isEmpty {
                        ContentUnavailableView.search(text: searchText)
                    }else {
                        LazyVGrid(columns: columns, content: {
                            
                            ForEach(viewModel.characters){ character in
                                NavigationLink {
                                    RMCharacterDetail(viewModel: viewModel, character: character)
                                } label: {
                                    RMCharacterCard(character: character)
                                }
                                .tint(.primary)
                            }
                            if viewModel.page < viewModel.totalPages {
                                ProgressView()
                                    .onAppear {
                                        viewModel.page += 1
                                        viewModel.fetchAllCharacters(status: selectedStatus == "None" ? "" : selectedStatus.lowercased(), species: selectedSpecies == "None" ? "" : selectedSpecies.lowercased())
                                    }
                            }
                        })
                        .padding()
                        
                    }
                }
                .navigationTitle("RM Characters")
                .sheet(isPresented: $isPresented, content: {
                    FilterView(selectedStatus: $selectedStatus, selectedSpecies: $selectedSpecies, isPresented: $isPresented, viewModel: viewModel)
                })
                .onChange(of: searchText) { _, newValue in
                    viewModel.fetchAllCharacters(filter: newValue, status: selectedStatus == "None" ? "" : selectedStatus.lowercased(), species: selectedSpecies == "None" ? "" : selectedSpecies.lowercased())
                    viewModel.page = 1
                }
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        withAnimation {
                            scrollView.scrollTo(1)
                            scrollOffset = 0
                            
                        }
                    } label: {
                        Image(systemName: "arrow.up")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(.green)
                    .clipShape(Circle())
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .offset(x: scrollOffset < 0 ? 0 : 70 )
                }
                .simultaneousGesture(DragGesture().onChanged { value in
                    withAnimation {
                        scrollOffset = value.translation.height
                    }
                })
            }
            
        }
        
    }
}

#Preview {
    RMListCharacters(viewModel: .init())
}




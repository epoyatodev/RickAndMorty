//
//  CustomPicker.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selectedOption: String
    var options: [String]
    var title: String
    var body: some View {
        HStack {
            Text("\(title): ")
            Picker("Filter \(title)",selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(DefaultPickerStyle())
        }
    }
}


#Preview {
    CustomPicker(selectedOption: .constant(""), options: ["Opcion1", "Opcion 2"], title: "Status")
}

//
//  LibraryView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var libraryViewModel: LibraryViewModel = LibraryViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: libraryViewModel.columns,spacing: 10, pinnedViews: [.sectionHeaders]) {
                Section {
                    Text("LibraryView")
                    Text("LibraryView")
                    Text("LibraryView")
                    Text("LibraryView")
                    Text("LibraryView")
                } header: {
                    Text("LibraryView")
                        .hLeading()
                }
            }
        }
        .padding()
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

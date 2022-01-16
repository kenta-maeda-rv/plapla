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
            LazyVGrid(columns: libraryViewModel.columns,spacing: 20, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(0..<10) { image in
                        Image(systemName: "folder")
                            .frame(width: 150, height: 150, alignment: .center)
                            .background(
                                Color.gray
                            )
                            .cornerRadius(15)
                    }
                } header: {
                    Text("LibraryView")
                        .hLeading()
                        .font(.largeTitle.bold())
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

//
//  LibraryView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel: LibraryViewModel = LibraryViewModel()
    
    @State var showContentDetailView = false
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: viewModel.columns,
                      spacing: 20,
                      pinnedViews: [.sectionHeaders])
            {
                Section {
                    ForEach(0..<10) { image in
                        Button(action: {
                            self.showContentDetailView.toggle()
                        }) {
                            Image(systemName: "folder")
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .center)
                                .background(
                                    Color.gray
                                )
                                .cornerRadius(15)
                        }
                        .sheet(isPresented: $showContentDetailView) {
                            ContentDetailView()
                        }
                        
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

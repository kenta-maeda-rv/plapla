//
//  LibraryView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel: LibraryViewModel = LibraryViewModel()
    
    @State var showContentAddView = false
    @State var showContentDetailView = false
    
    @State var contentId = ""
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical) {
                LazyVGrid(columns: viewModel.columns,
                          spacing: 20,
                          pinnedViews: [.sectionHeaders])
                {
                    Section {
                        ForEach(viewModel.contents, id: \.self) { contents in
                            Button(action: {
                                self.contentId = contents.contentId!
                                self.showContentDetailView.toggle()
                            }) {
                                ContentCardView(contentId: contents.contentId!)
                            }
                            .sheet(isPresented: $showContentDetailView) {
                                ContentDetailView(contentId: contents.contentId!)
                            }
                            
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("LibraryView")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showContentAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showContentAddView) {
                ContentAddView(contentId: contentId)
            }
        }
    }
    
    func ContentCardView(contentId: String) -> some View {
        VStack {
            Image(uiImage: ((ScreenUtil.getImage(contentId: contentId) ?? UIImage(named: "create"))!))
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .background(
                    Color.gray
                )
                .cornerRadius(15)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}


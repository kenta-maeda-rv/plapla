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
                if viewModel.contents.isEmpty {
                    Text("コンテンツを追加してください")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    LazyVGrid(columns: viewModel.columns,
                              spacing: 20,
                              pinnedViews: [.sectionHeaders])
                    {
                        Section {
                            ForEach(viewModel.contents, id: \.self) { contents in
                                NavigationLink(destination: ContentDetailView(detailViewContentId: contents.contentId!)) {
                                    ContentCardView(contentId: contents.contentId!)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("コンテンツ一覧")
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
            Image(uiImage: ((ScreenUtil.getImage(id: contentId) ?? UIImage(named: "create"))!))
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


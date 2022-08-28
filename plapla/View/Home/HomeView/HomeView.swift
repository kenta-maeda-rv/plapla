//
//  HomeView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @State var contentId = ""
    
    var body: some View {
        NavigationView{
            ZStack {
//                TimeLineVIew(contents: [])
                ContentAddButtonView(contentId: $contentId)
                    .hTrailing()
                    .vBottom()
            }
            .navigationTitle("タイムライン")
        }
    }
    
    
    struct ContentAddButtonView: View {
        @State var showContentAddView = false
        
        @Binding var contentId: String
        
        let circleWidth: CGFloat = 80
        
        var body: some View {
            VStack() {
                
                Button(action: {
                    self.showContentAddView.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: circleWidth,
                               height: circleWidth,
                               alignment: .center)
                        .padding(20)
                    
                }.sheet(isPresented: $showContentAddView) {
                    
                    PostView(contentId: contentId)
                
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

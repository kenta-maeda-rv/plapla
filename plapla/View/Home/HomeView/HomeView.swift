//
//  HomeView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("contentId") var contentId = ""
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @State var postDatas: [PostData] = [PostData(postId: "",
                                                 contentId: "",
                                                 postTitle: "",
                                                 postDiscription: "",
                                                 postDate: Date(),
                                                 ImageUrl:  "",
                                                 process: "")]
    @State var navigationTitle = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                TimeLineView(postDatas: $postDatas)
                ContentAddButtonView()
                    .hTrailing()
                    .vBottom()
            }
            .navigationTitle(self.navigationTitle)
            .onAppear {
                self.navigationTitle = self.viewModel.getContentTitle(id: contentId)
                self.postDatas = self.viewModel.getScreenData(contentId: contentId)
                print("HomeView表示時：\(self.postDatas)")
            }
        }
    }
    
    
    struct ContentAddButtonView: View {
        @State var showContentAddView = false
        
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
                    
                    PostView()
                
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

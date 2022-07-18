//
//  HomeView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollViewReader { scrollView in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 15) {
                            
                            Section {
                                CardsView()
                                
                            }
                        }
                    }
                    .onAppear {
                        scrollView.scrollTo(2, anchor: .center)
                    }
                }
                ContentAddButtonView()
                    .hTrailing()
                    .vBottom()
            }
            .navigationTitle("タイムライン")
        }
    }
    
    func CardsView() -> some View {
        LazyVStack {
            
//            ForEach(viewModel.contents) { content in
//                CardView(content: content)
//            }
            
        }
    }
    
    func CardView(content: Content)-> some View {
        HStack {
            
            VStack(spacing: 10) {
                Circle()
                    .fill(.black)
                    .frame(width: 15, height: 15)
                    .background(
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                    )
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            
            VStack {
                
                HStack(alignment: .top, spacing: 10) {
                    
                    Text(content.contentTitle)
                    Text(content.contentDrscription)
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                
                Image(uiImage: (UIImage(named: "create") ?? UIImage(systemName: "plus"))!)
                    .resizable()
                    .frame(height: 200)
            }
            .padding()
            .hLeading()
            .background(
                Color.gray
                    .cornerRadius(25)
            )
        }
        .padding()
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
                    
                    ContentAddView()
                
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

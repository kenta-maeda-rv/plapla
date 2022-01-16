//
//  HomeView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                
                Section {
                    
                    CardsView()
                    
                } header: {
                    
                    HeaderView()
                    
                }
            }
        }
    }
    
    func HeaderView()-> some View{
        HStack(spacing: 10) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Titile")
                    .font(.largeTitle.bold())
                
            }
            .hLeading()
        }
        .padding()
    }
    
    func CardsView() -> some View {
        LazyVStack {
            
            ForEach(homeViewModel.contents) { content in
                CardView(content: content)
            }
            
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
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(content.contentTitle)
                        Text(content.contentDrscription)
                            .font(.callout)
                            .foregroundColor(.secondary)
                        
                    }
                }
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

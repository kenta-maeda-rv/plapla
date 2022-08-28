//
//  TimeLineVIew.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

struct TimeLineVIew: View {
    
    @Binding var postDatas: [PostData]
    
    var body: some View {
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
    }
    
    func CardsView() -> some View {
        LazyVStack {
            
            ForEach(postDatas, id: \.self) { content in
                CardView(postData: content)
            }
            
        }
    }
    
    func CardView(postData: PostData)-> some View {
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
                    
                    Text(postData.postTitle!)
                    Text(postData.postDiscription!)
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                
                Image(uiImage: (((ScreenUtil.getImage(contentId: postData.contentId) ?? UIImage(named: "create"))!)))
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
}

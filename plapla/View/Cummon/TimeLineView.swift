//
//  TimeLineView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

struct TimeLineView: View {
    
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
                print("TimeLineView表示:\(postDatas)")
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
                HStack() {
                    tagView(process: postData.process!)
                    Spacer()
                    Text(ScreenUtil.dateFormatterToYYYYMMdd(date: postData.postDate!))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Image(uiImage: (((ScreenUtil.getImage(id: postData.postId) ?? UIImage(named: "create"))!)))
                        .resizable()
                        .frame(height: 200)
                        .cornerRadius(25)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(postData.postTitle!)
                            .font(.title3)
                            .bold()
                        Text(postData.postDiscription!)
                            .font(.body)
                        
                        Spacer()
                    }
                    
                }
            }
            .padding()
            .hLeading()
        }
        .padding()
    }
    func tagView(process: String) -> some View {
        VStack{
            Text(process)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(
            Color.accentColor
        )
        .cornerRadius(10)
        .hLeading()
        
    }
}


struct TimeLineView_Previews: PreviewProvider {
    @State static var postData:[PostData] = [PostData(postId: "postId",
                                                      contentId: "contentId",
                                                      postTitle: "postTitle",
                                                      postDiscription: "postDiscription",
                                                      postDate: Date(),
                                                      ImageUrl:  "ImageUrl",
                                                      process: "本組")]
    
    static var previews: some View {
        TimeLineView(postDatas: $postData)
    }
}

//
//  OnBoargingView.swift
//  VASvaluation
//
//  Created by まえけん on 2021/10/17.
//  Copyright © 2021 maeken. All rights reserved.
//

import SwiftUI

/// チュートリアル画面
struct OnBoargingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    /// ページのオフセット量
    @State var offset: CGFloat = 0
    
    var body: some View {
        OffsetPageTabView(offset: $offset) {
            
            HStack(spacing: 0) {
                
                ForEach(boardingScreens) { screen in
                    
                    VStack(spacing: 15) {
                        // 画像
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width / 1.5,
                                   height: getScreenBounds().width / 1.5)
                        
                        // 説明文
                        VStack(alignment: .leading, spacing: 12) {
                            Text(screen.title)
                                .font(.largeTitle.bold())
                            
                            Text(screen.description)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
                .padding()
                .frame(width: getScreenBounds().width)
                .frame(maxHeight: getScreenBounds().height)
            }
        }
        .overlay(
            
            VStack{
                
                // ボタン
                HStack(spacing: 25) {
                    // 始めるボタン
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("はじめる")
                            .fontWeight(.semibold)
                            .padding(.vertical, 20)
                            .frame(maxWidth: getScreenBounds().width)
                            .cornerRadius(12)
                    }
                }
                // ページコントロール
                HStack{
                    
                    // 現在ページ表示
                    HStack(spacing: 8) {
                        ForEach(boardingScreens.indices, id: \.self) { index in
                            Circle()
                                .fill(.black)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == (getIndex()) ? 1 : 0.85)
                                .animation(.easeInOut, value: getIndex())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 8)
            }
                .padding()
            ,alignment: .bottom
        )
    }
    
    /// 現在のベージ位置取得
    func getIndex() -> Int {
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
}

extension View {
    /// 画面サイズ取得
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct OnBoargingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoargingView()
    }
}

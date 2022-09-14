//
//  DetailView.swift
//  TripCoreMotion20
//
//  Created by cmStudent on 2022/09/02.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        
        VStack {
            ZStack{
                
                Image("drawingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 380, height: 200)
                        .clipped()
                Image("drawing")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .clipped()
            }
            .padding(20)
            Text("これは写真の紹介")
                .font(.title2)
                .bold()
            
            Text("買文ソエ人試ゅ生止ニラオミ復矯ぞ禁併タレキ支融ンがわイ芸町がづぜぐ要滴猛コ突縄でへ本編は治堂衛は。次げみゃ出前ぶはねへ手8政62求ほド上橋ホツヲア席伊ヒ場返まうこレ新救ヲス芸4政れそすく向重メユ磯物静定くーゅ購用セ経達剛嫌ぶば。資ユ軍本ク報69世かやむレ味初ヲ直著逮新ずべトり務売啓マヤハヒ一供コアレ写兄スム死女どよドこ国意ゅ掛台ちき投98台も花男初稚野聞くゃいほ。")
                .padding(20)
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

//
//  onBoarding.swift
//  TripCoreMotion20
//
//  Created by cmStudent on 2022/08/23.
//

import Foundation
import SwiftUI

struct onBoardingView: View {
    
    @Binding var shouldShowOnboarding: Bool
//    @StateObject var motionManager: MotionManager = .init()
    
    var body: some View {
        
        ZStack {
            Image("onboarding")
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Rectangle()
                        .foregroundColor(Color("Blue"))
                        .frame(width: 140, height: 50)
                        .cornerRadius(16)
                        .overlay(
                            HStack{
                                Text("はじめる")
                                    .font(.body)
                                    .bold()
                                    .foregroundColor(Color.white)
                                    
                                Image(systemName: "chevron.right.2")
                                    .foregroundColor(Color.white)
                                    .font(.body)
                            }
                        )
                })
                .position(x: 200, y: 730)
                Spacer()
                
            }
        }
       
        
        
    }
//    func overlayOffset() -> CGFloat {
//        let offset = motionManager.xValue * 7
//        if offset > 0 {
//            return offset > 8 ? 8 : offset
//
//        }
//        return -offset > 15 ? -15 : offset
//    }
}

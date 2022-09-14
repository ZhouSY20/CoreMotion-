//
//  Home.swift
//  TripCoreMotion20
//
//  Created by cmStudent on 2022/08/23.
//

import SwiftUI

struct Home: View {
    @State var shouldShowOnboarding: Bool = true
    @StateObject var motionManager: MotionManager = .init()
    @State var menu = 0
      
    var body: some View {
        NavigationView {
            VStack {
                //HeaderView()
                SearchBar()
                //tabView()
                topTab()
                ParallaxCards()
                    .padding(.horizontal, -15)
                TabBar()
            }
            .padding(10)
            .navigationBarTitle("旅行")
            .padding([.horizontal, .top], 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("bg"))
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            onBoardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
    
    func topTab() -> some View {
        HStack(spacing: 30) {
            Button(action: {
                self.menu = 0
            }) {
                Text("おすすめ")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(self.menu == 0 ? .white : .gray)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(self.menu == 0 ? Color("Blue") : Color.white.opacity(0.2))
            .clipShape(Capsule())
            
            Button(action: {
                self.menu = 1
                
            }) {
                Text("人気")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(self.menu == 1 ? .white : .gray)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(self.menu == 1 ? Color("Blue") : Color.white.opacity(0.2))
            .clipShape(Capsule())
            
            Button(action: {
                self.menu = 2
            }) {
                Text("更新")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(self.menu == 2 ? .white : .gray)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(self.menu == 2 ? Color("Blue") : Color.white.opacity(0.2))
            .clipShape(Capsule())
            
        }.padding(.top, 10)
    }
    
    func ParallaxCards() -> some View {
        TabView(selection: $motionManager.currentSlide) {
            ForEach(sample_places) { place in
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    ZStack{
                        Image(place.bgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: motionManager.currentSlide.id == place.id ? -motionManager.xValue * 75.0 : 0)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: motionManager.currentSlide.id == place.id ? overlayOffset() : 0)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                            .scaleEffect(1.05, anchor: .bottom)
                        NavigationLink(destination: DetailView(), label:{
                            
                            VStack {
                                Text("Explore")
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                    .frame(width: 150, height: 50)
                                    .background(Color.gray.opacity(0.4))
                                    .cornerRadius(10)
                                .padding(.bottom, 200)
                            }
                                
                        } )
                        
                        
                    }
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .animation(.interactiveSpring(), value: motionManager.xValue)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .tag(place)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .onAppear(perform: motionManager.detectMotion)
        .onDisappear(perform: motionManager.stopMotionUpdates)
        
    }
    

    
    func TabBar() -> some View {
        HStack(spacing: 0){
            ForEach(["house", "suit.heart", "person"],
                    id: \.self) { icon in
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.black.opacity(0.7))
                    .frame(maxWidth: .infinity)
                
            }
        }
    }
    
//    func tabView() -> some View {
//        TabView(selection: $count, content: {
//            Image("mountainBG")
//                .resizable(resizingMode: .stretch)
//                .frame(width: .infinity, height: 200)
//                .clipped()
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .tag(1)
//            Image("drawingBG")
//                .resizable(resizingMode: .stretch)
//                .frame(width: .infinity, height: 200)
//                .clipped()
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .tag(2)
//            Image("towerBG")
//                .resizable(resizingMode: .stretch)
//                .frame(width: .infinity, height: 200)
//                .clipped()
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .tag(3)
//
//        })
//        //.frame(height: 200)
//        .tabViewStyle(PageTabViewStyle())
//        .onReceive(timer, perform: { _ in
//                withAnimation(.default) {
//                    count = count == 5 ? 0 : count + 1
//                }
//            })
//    }

    func SearchBar() -> some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundColor(.gray.opacity(0.7))
            TextField("Search", text: .constant(""))
            Image(systemName:"mic")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.gray.opacity(0.7))
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.5))
        
        )
    }
    
    func overlayOffset() -> CGFloat {
        let offset = motionManager.xValue * 7
        if offset > 0 {
            return offset > 8 ? 8 : offset
        }
        return -offset > 15 ? -15 : offset

    }
    
    func HeaderView() -> some View {
        HStack{
            VStack(alignment: .leading, spacing: 6) {
                (Text("Hello")
                    .fontWeight(.semibold) +
                 Text(" Iris!")
                )
                .font(.title2)
                
                Text("新しい旅先の発見")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

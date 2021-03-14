//
//  ContentView.swift
//  UI-143
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var selectedtab : Int = 1
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View{
        
        ScrollView(.init()){
            
            TabView(selection:$selectedtab){
                
                ForEach(1...6,id:\.self){index in
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
                        GeometryReader{reader in
                            
                           
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(x: -reader.frame(in: .global).minX)
                                .frame(width: getrect().width, height: getrect().height / 2.3)
                                .rotationEffect(.init(degrees: -90))
                               
                        }
                        .frame(height: getrect().height / 2.3)
                        .cornerRadius(15)
                        
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(15)
                        
                        Image("p\(selectedtab)")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .padding(5)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: 20, y: -180)
                        
                    })
                    .padding(.horizontal,25)
                    
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .rotationEffect(.init(degrees: 90))
        }
        .background(
        
            AngularGradient(gradient: .init(colors: [.blue,.purple]), center: .center)
        )
        .ignoresSafeArea()
    }
}

extension View{
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

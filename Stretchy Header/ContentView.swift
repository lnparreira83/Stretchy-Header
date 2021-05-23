//
//  ContentView.swift
//  Stretchy Header
//
//  Created by Lucas Parreira on 19/05/21.
//

import SwiftUI

struct CardData{
    let id: Int
    let title: String
}

struct CardView: View{
    let data: CardData
    
    var body: some View {
        HStack{
            Image("app\(data.id)")
                .resizable()
                .scaledToFit()
                .frame(width:55,height:55)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text(data.title)
                    .bold()
                    .font(.system(size: 24))
                Text("Offers In-App Purchases")
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            Button(action: {
                
            },label:{
                Text("GET")
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
            })
        }
    }
}

struct ContentView: View {
    let appNames = ["Doodle Jump", "Subway Surfers","Asphalt Racing"]
    var body: some View {
        ScrollView(.vertical){
            VStack{
                //Header
                GeometryReader { proxy in
                    
                    let global = proxy.frame(in: .global)
                    
                    Image("wp")
                        .resizable()
                        .offset(y:global.minY > 0 ? -global.minY : 0)
                        .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height / 2.2) + global.minY : UIScreen.main.bounds.height / 2.2)
                        .padding(.top,-20)
                }
                .frame(height:UIScreen.main.bounds.height/2.2)
                
                VStack{
                    ForEach(1...2,id:\.self){ num in
                        let data = CardData(id: num,
                                            title: self.appNames[num - 1])
                        CardView(data: data)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  1424 Swift UI
//
//  Created by Bryant Irawan on 3/27/23.
//

import SwiftUI

struct PlayerCountView: View {
    
    @State var playerCount = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("diceeLogo")
                    Spacer()
                    Text("Select how many players:")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                    VStack {
                        HStack {
                            NavigationLink {
                                PlayerRollView(playerCount: 2, player: 1)
                            } label: {
                                PlayerCountDiceView(number: 2)
                            }
                            NavigationLink {
                                PlayerRollView(playerCount: 3, player: 1)
                            } label: {
                                PlayerCountDiceView(number: 3)
                            }
                        }
                        HStack {
                            NavigationLink {
                                PlayerRollView(playerCount: 4, player: 1)
                            } label: {
                                PlayerCountDiceView(number: 4)
                            }
                            NavigationLink {
                                PlayerRollView(playerCount: 5, player: 1)
                            } label: {
                                PlayerCountDiceView(number: 5)
                            }
                        }
                        HStack {
                            NavigationLink {
                                PlayerRollView(playerCount: 6, player: 1)
                            } label: {
                                PlayerCountDiceView(number: 6)
                            }
                        }
                    }
                }
                .offset( y: -60)
                
            }
        }
    }
}

struct PlayerCountDiceView: View {
    
    let number: Int
    
    
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .cornerRadius(2)
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
    
    
    
}




struct PlayerCountView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCountView()
    }
}

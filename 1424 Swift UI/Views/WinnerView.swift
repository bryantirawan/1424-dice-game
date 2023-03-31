//
//  WinnerView.swift
//  1424 Swift UI
//
//  Created by Bryant Irawan on 3/28/23.
//

import SwiftUI

struct WinnerView: View {

    var winner: Int
    var maxScore: Int

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
            Image("diceeLogo")
            Text("And the winner is....")
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("player \(winner) with a score of \(maxScore)")

            }
            .offset( y: -100)

    }
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(winner: 0, maxScore: 0)
    }
}

////
////  ScoreView.swift
////  1424 Swift UI
////
////  Created by Bryant Irawan on 3/31/23.
////
//
//import Foundation
//
//struct ScoreView: View {
//    @Environment(\.dismiss) var dismiss
//
//    @Binding var maxScore: Int
//    @Binding var score1: String
//    @Binding var score2: String
//    @Binding var score3: String
//    @Binding var score4: String
//    @Binding var score5: String
//    @Binding var score6: String
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Current Highest Dice Total: \(maxScore)")
//            }
//            HStack {
//                Text("Player1: ")
//                Text(score1)
//            }
//            HStack {
//                Text("Player2: ")
//                Text(score2)
//            }
//            HStack {
//                Text("Player3: ")
//                Text(score3)
//            }
//            HStack {
//                Text("Player4: ")
//                Text(score4)
//            }
//            HStack {
//                Text("Player5: ")
//                Text(score5)
//            }
//            HStack {
//                Text("Player6: ")
//                Text(score6)
//            }
//        }
//        Button("Press to dismiss") {
//            dismiss()
//        }
//        .font(.title)
//        .padding()
//        .background(.black)
//    }
//}

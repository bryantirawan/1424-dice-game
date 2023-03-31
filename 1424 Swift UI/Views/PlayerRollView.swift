//
//  PlayerRollView.swift
//  1424 Swift UI
//
//  Created by Bryant Irawan on 3/27/23.
//

import SwiftUI


struct PlayerRollView: View {
    
    var playerCount: Int
    
    @State var showingSheet = false
    
    @State var winner: Int = 0
    @State var maxScore: Int  = 0
    @State var currentArray: [Int] = []
    @State var player: Int
    
    @State var firstRoll = true
    @State var diceOneTapped = false
    @State var diceTwoTapped = false
    @State var diceThreeTapped = false
    @State var diceFourTapped = false
    @State var diceFiveTapped = false
    @State var diceSixTapped = false
    @State var oneDiceHasBeenAdded = false
    
    @State var dice1 = 1
    @State var dice2 = 2
    @State var dice3 = 3
    @State var dice4 = 4
    @State var dice5 = 5
    @State var dice6 = 6
    
    @State var scoreDictionary: [Int: [Int]] = [
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: []
    ]
    
    @State var score1: String = ""
    @State var score2: String = ""
    @State var score3: String = ""
    @State var score4: String = ""
    @State var score5: String = ""
    @State var score6: String = ""
    
    
    
    func currentArray(player: Int) {
        currentArray = scoreDictionary[player]!
    }
    
    func canRoll() -> Bool {
        if (oneDiceHasBeenAdded == true && currentArray.count < 6) || firstRoll == true {
            return true
        } else {
            return false
        }
    }
    
    func canTapDice(diceTapped: Bool) -> Bool {
        if firstRoll == true {
            return false
        } else if  diceTapped == true {
            return false
        } else {
            return true
        }
    }
    
    func resetDice() {
        dice1 = 1
        dice2 = 2
        dice3 = 3
        dice4 = 4
        dice5 = 5
        dice6 = 6
        
        diceOneTapped = false
        diceTwoTapped = false
        diceThreeTapped = false
        diceFourTapped = false
        diceFiveTapped = false
        diceSixTapped = false
        
        firstRoll = true
    }
    
    func calculateScore(player: Int, scoreArray: Array<Any>) -> String {
        if scoreDictionary[player]!.count == 0 {
            return ""
        }
        if scoreDictionary[player]!.contains(1) && scoreDictionary[player]!.contains(4) {
            let score = scoreDictionary[player]!.reduce(0, +) - 5
            return String(score)
        } else {
            return "it's a washhhhh"
        }
    }
    
    
    func calculateWinnerAndUpdateScores(playerCount: Int, scoreDictionary: [Int: [Int]]) {
        for i in (1...playerCount) {
            if scoreDictionary[i]!.contains(1) && scoreDictionary[i]!.contains(4) {
                let score = scoreDictionary[i]!.reduce(0, +) - 5
                if score > maxScore {
                    maxScore = score
                    winner = i
                } else {
                    continue
                }
            } else {
                continue
            }
        }
        self.score1 = calculateScore(player: 1, scoreArray: scoreDictionary[1]!)
        self.score2 = calculateScore(player: 2, scoreArray: scoreDictionary[2]!)
        self.score3 = calculateScore(player: 3, scoreArray: scoreDictionary[3]!)
        self.score4 = calculateScore(player: 4, scoreArray: scoreDictionary[4]!)
        self.score5 = calculateScore(player: 5, scoreArray: scoreDictionary[5]!)
        self.score6 = calculateScore(player: 6, scoreArray: scoreDictionary[6]!)
    }
    
    
    func addDiceScoretoCorrectPlayer(player: Int, diceScore: Int) {
        if scoreDictionary[player]!.count < 6 {
            scoreDictionary[player]!.append(diceScore)
            oneDiceHasBeenAdded = true
        } else {
            print("you already have six dice")
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("diceeLogo")
                    Spacer()
                    Text("Hello, player\(player)")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                    VStack {
                        HStack {
                            Text("Your dice collection: \(currentArray.map(String.init).joined(separator: ", "))")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                        HStack {
                            Button {
                                print("player\(player) added dice: \(dice1) to current array: \(currentArray)")
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice1)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                diceOneTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice1)
                            }
                            .disabled(!canTapDice(diceTapped: diceOneTapped))
                            Button {
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice2)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                print("player\(player) added dice: \(dice2) to current array: \(currentArray)")
                                diceTwoTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice2)
                            }
                            .disabled(!canTapDice(diceTapped: diceTwoTapped))
                        }
                        HStack {
                            Button {
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice3)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                print("player\(player) added dice: \(dice3) to current array: \(currentArray)")
                                diceThreeTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice3)
                            }
                            .disabled(!canTapDice(diceTapped: diceThreeTapped))
                            Button {
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice4)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                print("player\(player) added dice: \(dice4) to current array: \(currentArray)")
                                diceFourTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice4)
                            }
                            .disabled(!canTapDice(diceTapped: diceFourTapped))
                        }
                        HStack {
                            Button {
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice5)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                print("player\(player) added dice: \(dice5) to current array: \(currentArray)")
                                diceFiveTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice5)
                            }
                            .disabled(!canTapDice(diceTapped: diceFiveTapped))
                            Button {
                                addDiceScoretoCorrectPlayer(player: player, diceScore: dice6)
                                currentArray(player: player)
                                calculateScore(player: player, scoreArray: scoreDictionary[player]!)
                                print("player\(player) added dice: \(dice6) to current array: \(currentArray)")
                                diceSixTapped.toggle()
                            } label: {
                                PlayerCountDiceView(number: dice6)
                            }
                            .disabled(!canTapDice(diceTapped: diceSixTapped))
                        }
                        HStack {
                            Button(action: {
                                currentArray(player: player)
                                self.oneDiceHasBeenAdded = false
                                self.firstRoll = false
                                if diceOneTapped == false {
                                    self.dice1 = Int.random(in: 1...6)
                                }
                                if diceTwoTapped == false {
                                    self.dice2 = Int.random(in: 1...6)
                                }
                                if diceThreeTapped == false {
                                    self.dice3 = Int.random(in: 1...6)
                                }
                                if diceFourTapped == false {
                                    self.dice4 = Int.random(in: 1...6)
                                }
                                if diceFiveTapped == false {
                                    self.dice5 = Int.random(in: 1...6)
                                }
                                if diceSixTapped == false {
                                    self.dice6 = Int.random(in: 1...6)
                                }
                            })
                            
                            {
                                Text("Roll")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .padding(.all)
                            }
                            .offset(x: -5)
                            .disabled(!canRoll())
                        
                            Button {
                                if player < playerCount {
                                    if calculateScore(player: player, scoreArray: currentArray) == "it's a washhhhh" {
                                        playSound()
                                    }
                                    self.player = player + 1
                                    resetDice()
                                    currentArray(player: player)
                                } else {
                                    if calculateScore(player: player, scoreArray: currentArray) == "it's a washhhhh" {
                                        playSound()
                                    }
                                    calculateWinnerAndUpdateScores(playerCount: playerCount, scoreDictionary: scoreDictionary)
                                    showingSheet.toggle()
                                }
                            } label: {
                                Text("Next")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .padding(.all)
                            }
                            .sheet(isPresented: $showingSheet) {
                                ScoreView(maxScore: self.$maxScore, score1: self.$score1, score2: self.$score2, score3: self.$score3, score4: self.$score4, score5: self.$score5, score6: self.$score6)
                            }
                            .offset(x: 28)
                            .disabled(currentArray.count < 6)
                        }
                    }
                }
                .offset(y: -60)
            }
        }
        .toolbar {
            Button("Scores") {
                calculateWinnerAndUpdateScores(playerCount: playerCount, scoreDictionary: scoreDictionary)
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                ScoreView(maxScore: self.$maxScore, score1: self.$score1, score2: self.$score2, score3: self.$score3, score4: self.$score4, score5: self.$score5, score6: self.$score6)
            }
        }
        .accentColor(.white)
    }
}

struct ScoreView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var maxScore: Int
    @Binding var score1: String
    @Binding var score2: String
    @Binding var score3: String
    @Binding var score4: String
    @Binding var score5: String
    @Binding var score6: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Current Highest Dice Total: \(maxScore)")
            }
            HStack {
                Text("Player1: ")
                Text(score1)
            }
            HStack {
                Text("Player2: ")
                Text(score2)
            }
            HStack {
                Text("Player3: ")
                Text(score3)
            }
            HStack {
                Text("Player4: ")
                Text(score4)
            }
            HStack {
                Text("Player5: ")
                Text(score5)
            }
            HStack {
                Text("Player6: ")
                Text(score6)
            }
        }
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}



struct PlayerRollView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRollView(playerCount: 1, player: 1)
    }
}

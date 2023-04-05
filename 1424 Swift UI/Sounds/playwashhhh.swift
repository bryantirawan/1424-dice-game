//
//  playwashhhh.swift
//  1424 Swift UI
//
//  Created by Bryant Irawan on 3/31/23.
//

import Foundation
import AVFoundation

var washPlayer: AVAudioPlayer?

func playSound() {
    let url = Bundle.main.url(forResource: "washhhh", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        washPlayer = try AVAudioPlayer(contentsOf: url!)
        washPlayer?.play()
    } catch {
        print("error")
    }
}

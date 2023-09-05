//
//  soundEffects.swift
//  Fun Quizz
//
//  Created by Đại Đức on 02/09/2023.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("ERROR: Could not find and run the sound data!!!")
        }
    }
}
//
//  Game.swift
//  Apple Pie
//
//  Created by Jesse Tipton on 9/27/17.
//  Copyright © 2017 Caleb Hicks. All rights reserved.
//

import Foundation

struct Game {
    
    let word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    var coolFormattedWord: String {
        return String(word.map { guessedLetters.contains($0) ? $0 : "_" })
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}

//
//  Flashcards.swift
//  Git Gud
//
//  Created by iD Student on 7/31/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]) {
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}
class Cardcollection {
    public static var instance : Cardcollection = Cardcollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init() {
        
        cards = [ Flashcard(question: "Your name is dima", options: ["True","False"]),
                  Flashcard(question: "What's the capitol of Ukraine?", options:["Kiev", "Moscow", "Seattle", "London"]),
                  Flashcard(question: "Where is iD Tech's headquarters?", options:["Campbell, CA", "Albequerque, NM", "Beijing, CN"])]
        
        currentIndex = 0
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if currentIndex >= cards.count {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}

//
//  Math.swift
//  MathArena
//
//  Created by adam janusewski on 6/30/21.
//

import Foundation

class Math {
    var randomNumberOne: Int
    var randomNumberTwo: Int
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let answer: Int
    
    init(numOne: Int, numTwo: Int, choiceA: String, choiceB: String, choiceC: String, choiceD: String, correctAnswer: Int) {
        randomNumberOne = numOne
        randomNumberTwo = numTwo
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        answer = correctAnswer
    }
    
}

//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaper: Int, CaseIterable {
    case scissors = 1
    case rock
    case paper
}

enum Winner {
    case user
    case computer
    case tie
}



struct Player {
    let choice: RockScissorsPaper?
    
    init(userInput: Int) {
        choice = RockScissorsPaper(rawValue: userInput)
    }
    
    init() {
        choice = RockScissorsPaper.allCases.randomElement()
    }
}


struct Game {
    func validateMenu(from userInput: Int) -> Int {
        switch userInput {
        case 0...3:
            return userInput
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
    }
    
    func inputFromUser() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return validateMenu(from: number)
    }
    
    func inputFromUser(turn: Winner) -> Int {
        let turnString = turn == .user ? "[사용자 턴]" : "[컴퓨터 턴]"
        print("\(turnString) 가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return validateMenu(from: number)
    }
    
    func whoIsWinner(userChoice: RockScissorsPaper , computerChoice: RockScissorsPaper) -> Winner {
        let valueDifference = userChoice.rawValue - computerChoice.rawValue
        switch valueDifference {
        case -2, 1:
            return Winner.user
        case 2, -1:
            return Winner.computer
        default:
            return Winner.tie
        }
    }
    
    func printGameResult(winner result: Winner) {
        switch result {
        case Winner.user:
            print("이겼습니다!")
        case Winner.computer:
            print("졌습니다!")
        default:
            print("비겼습니다!")
        }
    }
    
    func terminateGame() {
        print("게임 종료")
    }
    
    func printMukjjibbaResult(winner: Winner) {
        if winner == .user {
            print("사용자의 승리!")
        } else {
            print("컴퓨터의 승리!")
        }
    }
    
    func playMukjjibba(winner turn: Winner) {
        let userInput = inputFromUser(turn: turn)
        let user = Player(userInput: userInput)
        let computer = Player()
        guard let userChoice = user.choice,
              let computerChoice = computer.choice
        else {
                terminateGame()
            return
        }
        print("유저: ", userChoice, " ,컴퓨터: ", computerChoice)
        let result = whoIsWinner(userChoice: userChoice, computerChoice: computerChoice)
        if result != Winner.tie {
            let turnString = result == .user ? "사용자" : "컴퓨터"
            print("\(turnString)의 승리!")
            playMukjjibba(winner: result)
        } else {
            printMukjjibbaResult(winner: turn)
        }
    }
    
    func play() {
        let userInput = inputFromUser()
        let user = Player(userInput: userInput)
        let computer = Player()
        guard let userChoice = user.choice,
              let computerChoice = computer.choice
        else {
                terminateGame()
            return
        }
        print("유저: ", userChoice, " ,컴퓨터: ", computerChoice)
        let result = whoIsWinner(userChoice: userChoice, computerChoice: computerChoice)
        printGameResult(winner: result)
        if result != Winner.tie {
            playMukjjibba(winner: result)
        }
        play()
    }
}

let game = Game()
game.play()

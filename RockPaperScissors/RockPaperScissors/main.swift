//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Game {
    var isPlaying = true
    //입력메시지 출력
    func printInputMessage() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    //알림메시지 출력
    func alertMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    //사용자 입력 받기1
    //    func inputFromUser() -> Int {
    //        guard let input = readLine(), let number = Int(input), (1...3).contains(number) else {
    //            print("잘못된 입력입니다. 다시 시도해주세요.")
    //            return inputFromUser()
    //        }
    //
    //        return number
    //    }
    
    enum UserRockPaperScissors: Int {
        case scissors = 1
        case rock
        case paper
    }
    
    enum ComputerRockPaperScissors: Int {
        case scissors = 1
        case rock
        case paper
    }
    
    //사용자 입력 받기2
    func inputFromUser() -> Int {
        guard let input = readLine(), let number = Int(input) else {
            alertMessage()
            return inputFromUser()
        }
        switch number {
        case 0:
            print("게임 종료")
            return 0
        case 1...3:
            return number
        default:
            alertMessage()
            return inputFromUser()
        }
    }
    
    //사용자 입력 검증
    func compareComputerNumberAndUserNumber(_ inputNumber: Int, _ computerNumber: Int) {
        //유저 패와 컴퓨터 패 비교 및 출력
        if (inputNumber == UserRockPaperScissors.scissors.rawValue && computerNumber == ComputerRockPaperScissors.paper.rawValue) || (inputNumber == UserRockPaperScissors.rock.rawValue && computerNumber == ComputerRockPaperScissors.scissors.rawValue) || (inputNumber == UserRockPaperScissors.paper.rawValue && computerNumber == ComputerRockPaperScissors.rock.rawValue) {
            print("이겼습니다!")
        } else if inputNumber == computerNumber {
            print("비겼습니다!")
        }   else {
            print("졌습니다!")
        }
    }
    //컴퓨터 숫자 생성
    func createComputerNumber() -> Int {
        let computerNumber = Int.random(in: 1...3)
        print("컴퓨터 숫자 확인 : ", computerNumber)
        return computerNumber
    }
    //게임 시작
    func gameStart() {
        printInputMessage()
        let inputNumber = inputFromUser()
        if inputNumber != 0 {
            let computerNumber = createComputerNumber()
            compareComputerNumberAndUserNumber(inputNumber, computerNumber)
        }
    }
}

let game = Game()
game.gameStart()



//
//  PlayViewModal.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import Foundation
import SwiftySound

@MainActor class GuessNumber: ObservableObject {
    @Published var isWin = false
    @Published var printableText = "Введите вариант числа от 1 до 250 и кликните по кнопке \"Проверить число!\""
    @Published var number: String = ""
    @Published var typedCounter = 0
    @Published var finalCount: [String] = []

    var randomNumber = UInt8.random(in: 1...250)
    func checkNumber(number: String) {
            if UInt8(number) ?? 0 < randomNumber{
                printableText = "Ваш вариант меньше загаданного числа"
                Sound.play(file: "dog", fileExtension: "wav", numberOfLoops: 0)
                typedCounter += 1
                print(typedCounter)
            } else if UInt8(number) ?? 0 > randomNumber {
                printableText = "Ваш вариант больше загаданного числа"
                Sound.play(file: "dog", fileExtension: "wav", numberOfLoops: 0)
                typedCounter += 1
                print(typedCounter)
            } else {
                printableText =  "Вы угадали"
                Sound.play(file: "cat", fileExtension: "wav", numberOfLoops: 0)
                isWin = true
                typedCounter += 1
                print(typedCounter)
                finalCount.append(String(typedCounter))
                randomNumber = UInt8.random(in: 1...250)
            }
        }
}

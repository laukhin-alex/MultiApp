//
//  PlayViewModal.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import Foundation

@MainActor class guessNumber: ObservableObject {
    @Published var isWin = false
    @Published var printableText = "Введите вариант числа от 1 до 250 и кликните по кнопке \"Проверить число!\""
    @Published var number: String = ""

    let randomNumber = UInt8.random(in: 1...250)
    func checkNumber(number: String) {


            if UInt8(number) ?? 0 < randomNumber{
                printableText = "Ваш вариант меньше загаданного числа"
            } else if UInt8(number) ?? 0 > randomNumber {
                printableText = "Ваш вариант больше загаданного числа"
            } else {
                printableText =  "Вы угадали"
                isWin = true

            }
        }
}

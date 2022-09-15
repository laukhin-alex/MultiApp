//
//  watchOSContentView.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import SwiftUI

struct watchOSContentView: View {
    @ObservedObject var playView = guessNumber()
    @State var allertText = ""
    @State var showsAlert = false
    @State var checkNumber = ""

    var body: some View {
        ZStack {
            ScrollView{
                VStack{
                    Text("Игра \"Отгадай число\"")
                        .fontWeight(.bold)

                        .padding([.top, .leading, .trailing], 0.0)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .center) {
                    Text(playView.printableText)
                }
                VStack(alignment: .center) {
                    Spacer()
                    TextField("Введите число от 1 до 250", text: $checkNumber)
                        .padding([.top, .leading, .trailing])
                        .controlSize(.mini)


                    Spacer()
                        .onAppear()
                        .scaleEffect(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        if !checkNumber.isUInt8  {
                            showsAlert = true
                            allertText = "Вы ввели некорректное число. Попробуйте снова"
                        } else {

                            playView.checkNumber(number: checkNumber)

                            checkNumber = ""
                            showsAlert = false
                        }

                    }) {
                        Text("Проверить число")
                            .background(Color.blue)
                    }
                    .alert(isPresented: $showsAlert) {
                        Alert(title: Text(allertText))
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(.white)
                    .padding(10)
                    Spacer()
                }

            }
        }


    }
}

struct watchOSContentView_Previews: PreviewProvider {
    static var previews: some View {
        watchOSContentView()
    }
}

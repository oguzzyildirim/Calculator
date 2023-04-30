//
//  ContentView.swift
//  Calculator
//
//  Created by Oğuz Yıldırım on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
  @State var result = "0"

  var tapped = CalculatorBrain()
  @State private var currentOperation: CalculatorBrain.CurrentOperations = .none

    var body: some View {
      //Text(CalculatorButtons.allCases.first?.rawValue ?? "NA"
      ZStack(alignment: .bottom){
        Color("Eerie Black").ignoresSafeArea()
        VStack (spacing: 18) {
          HStack{
            Spacer()
            Text(result)
              .foregroundColor(.white)
              .font(.system(size: 64))
              //.offset(x: -25, y: 0)
              .bold()

          }.padding()
          //You wrote CalculatorBrain.ButtonsArray in  foreach
          ForEach(CalculatorBrain.buttonsArray, id: \.self) {row in
            HStack (spacing: 13){
              ForEach(row, id: \.self) { button in
                if(button.rawValue == "0"){
                  Button(action: {
                    result = tapped.tappedButton(button: button, result: result)

                  }, label: {
                    Text(button.rawValue)
                      .font(.system(size: 32))
                      .frame(width: 175, height: 80, alignment: .center)
                      .foregroundColor(.white)
                    //.background(Color("Dark Liver"))
                      .background(button.buttonColor)
                      .cornerRadius(64)
                      .bold()
                  })
                }
                else if(button.rawValue == "AC" || button.rawValue == "±" || button.rawValue == "%") {
                  Button(action: {
                    result = tapped.tappedButton(button: button, result: result)

                  }, label: {
                    Text(button.rawValue)
                      .font(.system(size: 32))
                      .frame(width: 80, height: 80)
                      .foregroundColor(.white)
                    //.background(Color("Dark Liver"))
                      .background(button.buttonColor)
                      .cornerRadius(64)
                      .bold()
                  })
                }
                else {
                  Button(action: {
                    result = tapped.tappedButton(button: button, result: result)

                  }, label: {
                    Text(button.rawValue)
                      .font(.system(size: 32))
                      .frame(width: 80, height: 80)
                      .foregroundColor(.white)
                    //.background(Color("Dark Liver"))
                      .background(button.buttonColor)
                      .cornerRadius(64)
                      .bold()
                  })
                }
              }
            }
          }
        }.padding()
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

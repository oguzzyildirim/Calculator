//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Oğuz Yıldırım on 23.04.2023.
//

import Foundation
import SwiftUI

public class CalculatorBrain {
  public enum CalculatorButtons: String, CaseIterable{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "±"
    var buttonColor: Color {
      switch self {
      case .clear, .negative, .percent:
        return Color("Light Gray")
      case .divide, .multiply, .subtract, .add, .equal:
        return Color("Vivid Gamboge")
      default:
        return Color("Dark Liver")
      }
    }
  }
  public enum CurrentOperations {
    case add
    case subtract
    case divide
    case multiply
    case percent
    case none
  }
  
  public static var buttonsArray: [[CalculatorButtons]] = [
    [.clear, .negative, .percent, .divide],
    [.seven, .eight, .nine, .multiply],
    [.four, .five, .six, .subtract],
    [.one, .two, .three, .add],
    [.zero, .decimal, .equal],
  ]
  var unfinishedValue: Int = 0
  var previousValue: Int = 0
  var currentOperation: CurrentOperations = .none
  var equalTappedCount = 0
  var count = 0

  public func tappedButton(button: CalculatorButtons, result: String) -> String {
    let button: CalculatorButtons = button
    var result: String = result



    switch button {
    case .add, .subtract, .multiply, .divide, .equal, .percent:
      count += 1
      if(button == .add) {
        currentOperation = .add
        previousValue = Int(result) ?? 0
      }
      else if(button == .subtract) {
        currentOperation = .subtract
        previousValue = Int(result) ?? 0
      }
      else if(button == .multiply) {
        currentOperation = .multiply
        previousValue = Int(result) ?? 0
      }
      else if(button == .divide) {
        currentOperation = .divide
        previousValue = Int(result) ?? 0
      }
      else if(button == .percent) {
        currentOperation = .percent
        previousValue = Int(result) ?? 0
      }
      else if(button == .equal) {
        equalTappedCount = 1
        switch currentOperation {
        case .add:
          result = "\(previousValue + unfinishedValue)"
          return result
        case .subtract:
          result = "\(previousValue - unfinishedValue)"
          return result
        case .multiply:
          result = "\(previousValue * unfinishedValue)"
          return result
        case .divide:
          result = "\(previousValue / unfinishedValue)"
          return result
        case .percent:
          result = "\(Float(Float(previousValue) * Float(unfinishedValue / 100)))"
          return result
        case .none:
          return result
        }

      }
      if (button != .equal) {
        result = "0"
        //result = "\(previousValue)"
      }
    case .clear:
      result = "0"
    case .decimal, .negative:
      if(button == .negative){
        let tmp = Int(result) ?? 0
        result = "\(-tmp)"
        return result
      }
      break
    default:
      let number = button.rawValue
      if result == "0" {
        result = number
        unfinishedValue = Int(result) ?? 0
        return result
      }
      else {
        if(equalTappedCount == 1){
          result = ""
          equalTappedCount = 0
        }
        result = "\(result)\(number)"
        unfinishedValue = Int(result) ?? 0
        return result
      }
    }
    return result
  }
}

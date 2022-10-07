//
//  Extension.swift
//  RotationString
//
//  Created by SanazAhang on 10/7/22.
//

import Foundation

extension String{
    
    func isReversed(secondString:String)->Bool{
        var firstWord = self
        let secondWord = secondString
                
        if (firstWord.count == secondWord.count){
            let reversword = firstWord.reversed()
            var reversTemp = ""
            for char in reversword{
                firstWord = String(firstWord.dropLast())
                reversTemp.insert(char, at: reversTemp.startIndex)
                var nameReverse = "\(reversTemp)\(firstWord)"
                if (nameReverse == secondWord){
                    return true
                }else{
                    nameReverse = ""
                    continue
                }
            }
            return false
        }else{
            return false
        }
    }
}


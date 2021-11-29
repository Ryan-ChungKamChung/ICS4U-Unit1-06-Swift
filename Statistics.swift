//
//  Statistics.swift
//
//  Created by Ryan Chung
//  Created on 2021-11-25
//  Version 1.0
//  Copyright (c) 2021 Ryan Chung. All rights reserved.
//
//  This program calculates the mean, median and mode of a given dataset
//  located inside of a text file.
//

import Foundation

// Calculates the mean of the inputted array and returns it.
func mean(intArray: [Int]) -> Double {

    var sum = 0.0
    for number in intArray { sum += Double(number) }

    return sum / Double(intArray.count)
}

// Calculates the median of the inputted array by finding the middle, or 2
// middle numbers and finding the average. Returns the median.
func median(intArray: [Int]) -> Double {

    let sorted = intArray.sorted(by: <)
    let size = sorted.count
    let median: Double

    if size % 2 == 0 {
        median = Double((sorted[size / 2] + sorted[size / 2 - 1])) / 2
    } else {
        median = Double(sorted[(size - 1) / 2])
    }

    return median
}

// Calculates the mode of the inputted array and returns it.
func mode(intArray: [Int]) -> Set<Int> {

    var modes = Set<Int>()
    var maxCount = 0

    for number1 in intArray {

        var count = 0

        for number2 in intArray where number1 == number2 { count += 1 }

        if count > maxCount {
            maxCount = count
            modes.removeAll()
            modes.insert(number1)
        } else if count == maxCount {
            modes.insert(number1)
        }
    }

    return modes
}

// Collects CLI arguments, parses it into an array of strings and then into an
// array of ints.
let filename = CommandLine.arguments[1]
let contents = try String(contentsOfFile: filename)
let lines = contents.split(separator: "\n")

var intArray = [Int]()
intArray.reserveCapacity(lines.count)

for line in lines where !line.isEmpty {
    intArray.append(Int(line)!)
}

// Calls mean, median and mode functions inputting the array of ints.
let meanValue = mean(intArray: intArray)
let medianValue = median(intArray: intArray)
let modeValue = Array(mode(intArray: intArray)).sorted()

// Displays the calculations to the user.
print(intArray)
print("\nCalculating Stats...")
print("The mean is: \(meanValue)")
print("The median is: \(medianValue)")
print("The mode is/are: \(modeValue)")

//
//  main.swift
//  ATM
//
//  Created by kimseongjun on 2022/06/11.
//

import Foundation

var n = Int(readLine()!)!

var rank = readLine()!.components(separatedBy: " ").map{Int($0)!}

var sum : Int = 0

var result : Int = 0

rank.sort()


for i in 0..<n {
    sum += rank[i]
    result += sum
}

print(result)



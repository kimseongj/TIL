//
//  main.swift
//  동전 0
//
//  Created by kimseongjun on 2022/06/11.
//

import Foundation

var coin = [Int]()
var arr = readLine()!.components(separatedBy: " ").map{Int($0)!}
var n = arr[0]
var k = arr[1]
var count: Int = 0
var result: Int = 0

for _ in 0..<n {
    coin.append(Int(readLine()!)!)
}

for j in (0...(coin.count-1)).reversed() {
    if coin[j] <= k {
      count = k/coin[j]
      k = k%coin[j]
        result += count
        if n == 0 {
            break
        }
    }
}
print(result)

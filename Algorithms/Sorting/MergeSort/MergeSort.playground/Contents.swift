/*
 *  병합 정렬 구현.
 */

import UIKit

func mergeSort(_ list: [Int]) -> [Int] {
    
    if list.count <= 1 { return list }
    
    let mid = list.count / 2
    let leftList = Array(list[0..<mid])
    let rightList = Array(list[mid..<list.count])
    
    return merge(mergeSort(leftList), mergeSort(rightList))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    
    var result = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    return result + left + right
}

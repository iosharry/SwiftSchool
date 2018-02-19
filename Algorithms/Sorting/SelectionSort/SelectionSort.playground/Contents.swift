/*
 *  선택 정렬 구현.
 */

import UIKit

func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array
    
    for i in 0 ..< arr.count - 1 {
        var lowest = i
        
        for j in i + 1 ..< arr.count {
            if arr[j] < arr[lowest] {
                lowest = j
            }
        }
        
        if i != lowest {
            arr.swapAt(i, lowest)
        }
    }
    
    return arr
}

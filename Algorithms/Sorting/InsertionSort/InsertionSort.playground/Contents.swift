/*
 *  삽입 정렬 구현.
 */

import UIKit

func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    
    for i in 0 ... arr.count - 1 {
        var temp = i
        while temp > 0 && arr[temp] < arr[temp - 1] {
            arr.swapAt(temp - 1, temp)
            temp -= 1
        }
    }
    
    return arr
}

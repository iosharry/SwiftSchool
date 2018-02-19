/*
 *  버블 정렬 구현
 */

import UIKit

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array

    for i in 0 ..< arr.count {
        for j in 0 ..< arr.count - 1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
    return arr
}

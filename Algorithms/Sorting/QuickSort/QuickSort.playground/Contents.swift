/*
 *  퀵 정렬 구현.
 */

import UIKit

func quickSort(_ array: [Int]) -> [Int] {
    
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    guard array.count > 1 else { return array }
    
    let pivot = array[0]
        
    for i in array {
        if i < pivot {
            less.append(i)
        }
        if i == pivot {
            equal.append(i)
        }
        if i > pivot {
            greater.append(i)
        }
    }
    return quickSort(less) + equal + quickSort(greater)
}

func quickSort2(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort2(less) + equal + quickSort2(greater)
}

//
//  main.swift
//  Homework2
//
//  Created by Евгений Борисов on 16.04.2024.
//

import Foundation

func fillSafetyArray(with queue: DispatchQueue) -> ThreadSafetyArray<Int> {
    let dispatchGroup = DispatchGroup()
    let safetyArray = ThreadSafetyArray<Int>()
    let workItem = DispatchWorkItem {
        for i in 1...1000 {
            safetyArray.append(i)
        }
    }

    queue.async(group: dispatchGroup, execute: workItem)
    queue.async(group: dispatchGroup, execute: workItem)
    dispatchGroup.wait()

    return safetyArray
}

func checkElementsAndCount(safetyArray: ThreadSafetyArray<Int>) {
    for i in 0..<safetyArray.count {
        print(safetyArray[i])
    }
    print("Count: \(safetyArray.count)")
}

func checkRemovingIn(safetyArray: ThreadSafetyArray<Int>, with queue: DispatchQueue) {
    let dispatchGroup = DispatchGroup()
    let delete = DispatchWorkItem {
        for i in (100...1999).reversed() {
            safetyArray.remove(at: i)
        }
    }

    queue.async(group: dispatchGroup, execute: delete)
    queue.async(group: dispatchGroup, execute: delete)
    dispatchGroup.wait()
}

func checkContainsIn(safetyArray: ThreadSafetyArray<Int>, with queue: DispatchQueue) {
    let dispatchGroup = DispatchGroup()
    let checkContains = DispatchWorkItem {
        for i in 1...100 {
            let element = Int.random(in: 1...1999)
            let result = safetyArray.contains(element)
        }
    }

    queue.async(group: dispatchGroup, execute: checkContains)
    queue.async(group: dispatchGroup, execute: checkContains)
    dispatchGroup.wait()
    print("End Contains")
}

func main() {
    let queue = DispatchQueue(label: "ThreadSafetyCheck", attributes: .concurrent)

    let safetyArray = fillSafetyArray(with: queue)
    checkElementsAndCount(safetyArray: safetyArray)
    checkRemovingIn(safetyArray: safetyArray, with: queue)
    checkElementsAndCount(safetyArray: safetyArray)
    checkContainsIn(safetyArray: safetyArray, with: queue)
}

main()

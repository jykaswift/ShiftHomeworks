//
//  main.swift
//  Homework2
//
//  Created by Евгений Борисов on 16.04.2024.
//

import Foundation

func main() {
    let queue = DispatchQueue(label: "11", attributes: .concurrent)
    let safetyArray = ThreadSafetyArray<Int>()

    let dispatchGroup = DispatchGroup()

    let workItem = DispatchWorkItem {
        for i in 1...1000 {
            safetyArray.append(i)
        }
    }

    queue.async(group: dispatchGroup, execute: workItem)
    queue.async(group: dispatchGroup, execute: workItem)
    dispatchGroup.wait()

    print(safetyArray.count)
}

main()

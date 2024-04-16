//
//  ThreadSafetyArray.swift
//  Homework2
//
//  Created by Евгений Борисов on 16.04.2024.
//

import Foundation

public class ThreadSafetyArray<T> {
    private var array = [T]()
    private var lock = NSLock()

    subscript(_ index: Int) -> T {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array[index]
    }

    var count: Int {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.count
    }

    var isEmpty: Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.isEmpty
    }


    func append(_ item: T) {
        lock.lock()
        array.append(item)
        lock.unlock()
    }

    func remove(at index: Int) {
        lock.lock()
        array.remove(at: index)
        lock.unlock()
    }
}

public extension ThreadSafetyArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.contains(element)
    }
}

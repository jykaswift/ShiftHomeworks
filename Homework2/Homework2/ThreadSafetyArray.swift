//
//  ThreadSafetyArray.swift
//  Homework2
//
//  Created by Евгений Борисов on 16.04.2024.
//

import Foundation


fileprivate protocol ThreadSafetyArrayProtocol {
    associatedtype Element

    var array: [Element] { get set }
    var lock: NSLock { get set }

    subscript(_ index: Int) -> Element { get }
    var count: Int { get }
    var isEmpty: Bool { get }

    func append(_ item: Element)
    func remove(at index: Int)
    func contains<T>(_ element: T) -> Bool where T.Type == Element.Type, T: Equatable
}

public class ThreadSafetyArray<T>: ThreadSafetyArrayProtocol {
    
    fileprivate var array = [T]()
    fileprivate var lock = NSLock()

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

        if array.indices.contains(index) {
            array.remove(at: index)
        } else {
            print("Warning: there is no such index in the array [\(index)]")
        }

        lock.unlock()
    }
}

extension ThreadSafetyArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.contains(element)
    }
}

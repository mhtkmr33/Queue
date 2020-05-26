import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Usage
        let queueObject = Queue<Int>()
        queueObject.enqueue(value: 3)
        queueObject.enqueue(value: 2)
        queueObject.enqueue(value: 1)
        queueObject.displayQueueElements() // 1 2 3
        queueObject.dequeue() // 3
        queueObject.displayQueueElements() // 1 2
    }
}

class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

class Queue<T> {

    var head: Node<T>?
    
    func enqueue(value: T) {
        let newNode = Node(value: value, next: nil)
        if head == nil {
            head = newNode
            return
        }
        let currentHead = head
        head = newNode
        head?.next = currentHead
    }
    
    func dequeue() {
        var currentNode = head
        var previousNode: Node<T>?
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        print("Dequeued element", currentNode?.value ?? "Nothing is here")
        previousNode?.next = nil
        
    }

    func displayQueueElements() {
        var current = head
        while current?.next != nil {
            print(current?.value ?? "Nothing is here")
            current = current?.next
        }
        print(current?.value ?? "Nothing is here")
    }
}

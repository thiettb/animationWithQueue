//
//  ViewController.swift
//  DemoAnimation
//
//  Created by ThietTB on 7/17/17.
//  Copyright © 2017 bipbipdinang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var disk: UIView! = nil
    var pointArray : [CGPoint] = [CGPoint(x: 15, y: 100),
                                  CGPoint(x: 20, y: 200),
                                  CGPoint(x: 30, y: 300),
                                  CGPoint(x: 60, y: 400),
                                  CGPoint(x: 80, y: 500),]
    var queue = Queue<CGPoint>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.disk = UIView(frame: CGRect(x: 10, y: 100, width: 100, height: 24))
        self.disk.backgroundColor = UIColor.blue
        self.view.addSubview(self.disk)
        
        queue.enqueue(CGPoint(x: 15, y: 100))
        queue.enqueue(CGPoint(x: 25, y: 100))
        queue.enqueue(CGPoint(x: 35, y: 200))
        queue.enqueue(CGPoint(x: 45, y: 300))
        queue.enqueue(CGPoint(x: 65, y: 500))
        queue.enqueue(CGPoint(x: 75, y: 100))
        queue.enqueue(CGPoint(x: 85, y: 300))
        queue.dequeue()
        print(queue)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.animate(view: self.disk, index: 0)
        self.animateQueue(view: self.disk, index: 0)
    }
    
    func animate(view: UIView, index: Int){
        if index < pointArray.count{
        UIView.animate(withDuration: 1.0, animations: {
            self.disk.center = self.pointArray[index]
        }) { (finished) in
            self.animate(view: view, index: index + 1)
        }
        }else{
            print("done")
        }
    }
    
    func animateQueue(view: UIView, index : Int){
        if index < queue.count{
        UIView.animate(withDuration: 1.0, animations: {
            self.disk.center = self.queue.dequeue()!
        }) { (finished) in
            self.animate(view: view, index: index + 1)
            }
        }else{
            print("done")
        }
    
    }
    

}
//extension UIView{
//    func animation(queue: Queue<CGPoint>){
//        
//       UIView.animate(withDuration: 1.0, animations: { 
//        self.center = queue.dequeue()
//       }) { (finished) in
//        self.animation(queue: queue)
//        }
//    }
//
//}
public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}







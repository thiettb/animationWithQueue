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
    var queue = Queue<AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.disk = UIView(frame: CGRect(x: 10, y: 100, width: 100, height: 24))
        self.disk.backgroundColor = UIColor.blue
        self.view.addSubview(self.disk)
        
        // add to queue
        queue.enqueue(CGPoint(x: 90, y: 100) as AnyObject)
        queue.enqueue(UIColor.red as AnyObject)
        queue.enqueue(CGAffineTransform(rotationAngle: CGFloat(M_PI/2)) as AnyObject)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.animate(view: self.disk, index: 0)
        self.animateQueue(view: self.disk)
    }
    
//    func animate(view: UIView, index: Int){
//        if index < pointArray.count{
//        UIView.animate(withDuration: 1.0, animations: {
//            self.disk.center = self.pointArray[index]
//        }) { (finished) in
//            self.animate(view: view, index: index + 1)
//        }
//        }else{
//            print("done")
//        }
//    }
    
    func animateQueue(view: UIView){
        print(queue.count)
        print(index)
        if (queue.count > 0){
        UIView.animate(withDuration: 2.0, animations: {
            let item : AnyObject = self.queue.dequeue() as AnyObject
            print(point)
            if item is CGPoint{
                view.center = point as! CGPoint
            }
            if item is UIColor{
                view.backgroundColor = point as! UIColor
            }
            if item is CGAffineTransform{
                view.transform = point as! CGAffineTransform
            }
            
        }) { (finished) in
            self.animateQueue(view: view)
            }
        
        }else {
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







# **Animation with Queue**

Animation kết hợp với queue để hoạt hình đa cảnh trong UIVie

**Cấu trúc của Queue**

```
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
```

**Khai báo 1 Queue với AnyObject**

```
var queue = Queue<AnyObject>()
```

**Áp dụng đệ quy để giải quyết bài toán**

```
func animateQueue(view:UIView){
    print(queue.count)
    print(index)
    if(queue.count>0){
        UIView.animate(withDuration:2.0, animations: {
        letpoint :AnyObject=self.queue.dequeue()asAnyObject
        print(point)
        ifpointisCGPoint{
            view.center= pointas!CGPoint
        }
        ifpointisUIColor{
            view.backgroundColor= pointas!UIColor
        }
        ifpointisCGAffineTransform{
            view.transform= pointas!CGAffineTransform
        }
        }) { (finished)in
        self.animateQueue(view: view)
    }
    }else{
        print("done")
        }
}
```




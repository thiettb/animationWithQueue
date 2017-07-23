# **Animation with Queue**

Animation kết hợp với Queue để hoạt hình đa cảnh trong UIView.Ở bài này mình muốn dễ quản lý cũng như để dễ tái sử dụng thì mình chia ra 3 class nhỏ:

* Cấu trúc của Queue
* Class quản lý những hoạt cảnh và Timer của nó
* Class thực thi hành động 

## **Cấu trúc của Queue**

```Swift
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

## Tạo 1 lớp để lưu trữ các hành động mà muốn hoạt cảnh và timer của nó

```Swift
class AnimateItem: NSObject {

    //Mark:: Property
    var item : AnyObject
    var animateTime : CGFloat

    init(item : AnyObject , time : CGFloat) {
        self.item = item
        self.animateTime = time

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```

## Tạo 1 lớp thực thi tất cả hành động sử dụng đệ quy

```Swift
class AnimationWithQueue: UIView {
    //Mark: Property
    var queue = Queue<AnimateItem>()

    init(frame: CGRect ,queue: Queue<AnimateItem>) {
        self.queue = queue
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //Mark: Function
    func animateQueue(view: UIView){
        if (queue.count > 0){
            let dequeue = self.queue.dequeue()
            let item : AnyObject = dequeue?.item as AnyObject
            let time : CGFloat = (dequeue?.animateTime)! as CGFloat
            UIView.animate(withDuration: TimeInterval(time), animations: {
                if item is CGPoint{
                    view.center = item as! CGPoint
                }
                if item is UIColor{
                    view.backgroundColor = item as? UIColor
                }
                if item is CGAffineTransform{
                    view.transform = item as! CGAffineTransform
                }
            }, completion: { (finished) in
                self.animateQueue(view: view)
            })
        }
    }   
}
```




import Foundation
import Cocoa

public protocol INode {
    var children : [INode] { get }
}

public class Node : NSObject, INode
{
    public init (_ description: String, _ children: [Node]) {
        self._description = description
        self._children = children
    }
    
    public convenience init (_ description: String) {
        self.init(description, [])
    }
    
    var _children : [Node]
    public var children : [INode] {
        get {
            return _children
        }
    }
    
    var _description: String
    public override var description : String {
        get {
            return _description
        }
    }
    
    public func updateDescription(newValue: String) {
        print("Updated \(newValue)")
        _description = newValue;
    }
}



public class OutlineViewDataSource : NSObject, NSOutlineViewDataSource {
    
    var store : [Node]
    
    public init(store:[Node]) {
        self.store = store
    }
    
        
    @objc public func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        
        if let node = item as? Node { return node._children.count > 0 }
        
        return true
    }
    
    @objc public func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject? {
        
        if let node = item as? Node { return node.description }
        
        return nil
    }
    
    @objc public func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        
        if (item == nil) { return store[index]}
        
        if let node = item as? Node { return node._children[index] }
        
        return Node("WRONG")
    }
    
    @objc public func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        
        if (item == nil) { return store.count; }
        
        if let node = item as? Node { return node._children.count }
        
        return 0
    }
    
}


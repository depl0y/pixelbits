//
//  PBNodeCollection.swift
//  pixelbits
//
//  Created by Wim Haanstra on 13/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class PBNodeCollection {
    
    /// A collection of `PBNode` objects stored in the root of the loaded stylesheet.
    internal var nodes: [PBNode] = [PBNode]()
    
    /// Variables that are specified in the root of the loaded stylesheet.
    internal var variables = PBVariables()
    
    /// Cached `PNNode` objects stored for a `UIViewLocation`. Speeds up lookups.
    private var compiledNodes = Dictionary<UIViewLocation, PBNode>()
    
    /**
     Loads a Dictionary and parses the data in it. This will also parse any variables defined at the root node.
     
     - parameter dictionary: The stylesheet serialized to a `NSDictionary` object.
     */
    func loadStylesheet(dictionary: Dictionary<String, AnyObject>) {
        
        let variables = dictionary.filter { (key, value) -> Bool in
            return key.hasPrefix("$")
        }
        
        for (variable, value) in variables {
            if let valueString = value as? String {
                self.variables.add(variable, value: valueString)
            }
        }
        
        for (key, value) in dictionary {
            if let childDictionary = value as? Dictionary<String, AnyObject> {
                
                let node = PBNode(key: key, style: childDictionary)
                self.nodes.append(node)
            }
        }
    }
    
    /**
     Get a compiled style for a `UIView` located at a specific path
     
     - parameter location: The location of the `UIView`
     
     - returns: A `PBNode` which is filled with the found properties, which are added based on the priority of the rules found
     */
    func compileNodeForLocation(location: UIViewLocation) -> PBNode {
        
        if self.compiledNodes[location] != nil {
            return self.compiledNodes[location]!
        }
        
        let nodes = self.findNodesForLocation(location)
        
        let compiledNode = PBNode(key: location.toString())
        
        for node in nodes {
            for prop in node.properties {
                compiledNode.addProperty(prop)
            }
            
            for subview in node.subviews {
                compiledNode.addSubview(subview)
            }
        }
        
        self.compiledNodes[location] = compiledNode
        
        return compiledNode
    }
    
    /// The count of the nodes in this collection
    var count: Int {
        get {
            return self.nodes.count
        }
    }
    
    /**
     Append a `PBNode` object to this collection
     
     - parameter node: The `PBNode` object to add
     */
    func append(node: PBNode) {
        self.nodes.append(node)
    }
    
    /**
     Append multiple `PBNode` objects to this collection
     
     - parameter nodes: The `PBNode` objects to add to this location
     */
    func appendContentsOf(nodes: [PBNode]) {
        self.nodes.appendContentsOf(nodes)
    }
    
    /**
     Check if a `PBNode` and `UIViewLocation` are matching
     
     - parameter node:     The `PBNode` object
     - parameter location: The `UIViewLocation` object
     
     - returns: `true` if they match (and parents), otherwise `false`
     */
    private func isNodeValid(node: PBNode, location: UIViewLocation) -> Bool {
        
        if node.key == location.className || node.key == location.fullName || node.key == location.styleString {
            if node.parent != nil && location.parent != nil {
                return isNodeValid(node.parent!, location: location.parent!)
            }
            else if node.parent == nil && location.parent != nil {
                return true
            }
            else if node.parent == nil && location.parent == nil {
                return true
            }
            else { // node.parent != nil && location.parent == nil
                return false
            }
        }
        else {
            return false
        }
        
    }
    
    /**
     Uses an `UIViewLocation` object to return a set of `PBNode` objects which are affecting the `UIView`.
     
     - parameter location: An `UIViewLocation` object.
     
     - returns: An array of `PBNode` objects which are affecting this `UIViewLocation`
     */
    private func findNodesForLocation(location: UIViewLocation) -> [PBNode] {
        
        var result = self.findNodesWithKey(self.nodes, key: location.className)
        
        if (location.style != nil) {
            result.appendContentsOf(self.findNodesWithKey(self.nodes, key: location.styleString))
            result.appendContentsOf(self.findNodesWithKey(self.nodes, key: location.fullName))
        }
        
        for node in result {
            if !isNodeValid(node, location: location) {
                result.removeObject(node)
            }
        }
        
        return result
    }
    
    /**
     Finds all `PBNode` objects with a certain key in the supplied `PBNode` collection.
     
     - parameter nodes:     The `PBNode` collection to search through
     - parameter key:       The key to search for
     - parameter recursive: Whether or not to search recursivly through the `PBNode` collection
     
     - returns: An array of `PBNode` objects that match the specified `key` value.
     */
    private func findNodesWithKey(nodes: [PBNode], key: String, recursive: Bool = true) -> [PBNode] {
        
        var result = [PBNode]()
        
        for node in nodes {
            if node.key == key {
                result.append(node)
            }
        }
        
        if recursive {
            for node in nodes {
                if result.contains(node) {
                    continue
                }
                
                let childNodes = self.findNodesWithKey(node.nodes, key: key)
                result.appendContentsOf(childNodes)
            }
        }
        
        return result
        
    }
    
}

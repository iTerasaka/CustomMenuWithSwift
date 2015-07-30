//
//  MyPlugin.swift
//  Sample001_HelloWorld
//
//  Created by i_terasaka on 2015/07/28.
//  Copyright (c) 2015年 i_terasaka. All rights reserved.
//

import Foundation
import AppKit

class MyPlugin:NSObject {
    
    class func pluginDidLoad(bundle: NSBundle) {
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "setMenu",
            name: NSApplicationDidFinishLaunchingNotification,
            object: nil
        )
    }
   
    class func setMenu(){
        
        NSLog("___________Sample001_____Called HelloWorld.setMenu() :)")
        
        if let mainMenu = NSApp.mainMenu ?? nil {
            
            // 既存のメニューに項目を追加する
            
            let editMenu = mainMenu.itemWithTitle("Edit")
            let newItemInEdit = NSMenuItem(title: "Hello World", action: "printHelloWorld", keyEquivalent: "")
            
            newItemInEdit.target = self
            editMenu?.submenu?.addItem(newItemInEdit)
            
            
            // 新しいメニューを追加する
            
            let myMenu = NSMenu(title: "MyMenu")
            let myMenuItem1 = NSMenuItem(title: "Hello World1", action: "printHelloWorld", keyEquivalent: "")
            let myMenuItem2 = NSMenuItem(title: "Who am I", action: "printMe", keyEquivalent: "")
            
            myMenuItem1.target = self
            myMenuItem2.target = self
            myMenu.addItem(myMenuItem1)
            myMenu.addItem(myMenuItem2)
            
            let newMenuItem = NSMenuItem(title: "MyMenu", action: nil, keyEquivalent: "")
            newMenuItem.submenu = myMenu
           
            mainMenu.addItem(newMenuItem)
        }
       
    }
    
    class func printHelloWorld(){
        NSLog("___________Sample001_____Hello world :)")
    }
    
    class func printMe(){
        NSLog("___________Sample001_____My Name is Ikuya Terasaka:)")
    }
}
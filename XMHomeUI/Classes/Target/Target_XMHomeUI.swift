//
//  Target_XMHomeUI.swift
//  XMMediator
//
//  Created by flowerflower on 2021/9/1.
//

import Foundation

@objc public class Target_XMHomeUI: NSObject {
    
    ///
    @objc public func Action_homeViewController(_ param: NSDictionary) -> UIViewController? {
        let vc =  XMHomeViewController()
        return vc
    }
}


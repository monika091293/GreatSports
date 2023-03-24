//
//  Extension.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 22/03/2023.
//

import Foundation
import UIKit
extension UIView{
    func addShadow(){
        layer.cornerRadius = 10.0
        layer.borderColor  =  UIColor.clear.cgColor
        layer.borderWidth = 3.0
        layer.shadowOpacity = 0.5
        layer.shadowColor =  UIColor.lightGray.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width:5, height: 5)
        layer.masksToBounds = true
    }
}

extension UIViewController{
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func addLoader(){
    let loadingVC = LoadingViewController()

    // Animate loadingVC over the existing views on screen
    loadingVC.modalPresentationStyle = .overCurrentContext

    // Animate loadingVC with a fade in animation
    loadingVC.modalTransitionStyle = .crossDissolve
           
    present(loadingVC, animated: true, completion: nil)
    }
    func dismissLoadr(){
        let loadingVc = LoadingViewController()
//        if !loadingVc.isBeingDismissed{
        self.dismiss(animated: true)
//        }
    }
}


extension Dictionary where Value: Equatable {
    func findKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

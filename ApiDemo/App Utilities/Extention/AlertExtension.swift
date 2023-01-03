//
//  AlertExtension.swift
//  Travel-Bella
//
//  Created by iMac on 14/07/22.
//

import Foundation
import UIKit
import Photos

extension UIViewController{
    
    func showAlert(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(action)
        controller.addAction(cancel)
        self.present(controller, animated: true, completion: nil)
    }
    
    func showAlertWithComplition(title: String, message: String, ok: @escaping ((_: UIAlertAction) -> Void)) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: ok)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    func setupForAlert() {
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    func push (_ id : String){
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: id){
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    func pop()  {
        self.navigationController?.popViewController(animated: true)
    }


    func dismissKeyboard() {
        view.endEditing(true)
    }

    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: self.view.frame.size.width , height: self.view.frame.size.height), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
}


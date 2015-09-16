//
//  ViewController.swift
//  CameraPractice
//
//  Created by Cynthia Wang on 9/16/15.
//  Copyright © 2015 Cynthia Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func captureButtonPressed(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .Camera
            imagePickerController.allowsEditing = false
            
            self.presentViewController(imagePickerController, animated: true, completion:nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.dismissViewControllerAnimated(true){ () -> Void in }
        self.imageView.image = image
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true){ () -> Void in
        }
        
    }


}


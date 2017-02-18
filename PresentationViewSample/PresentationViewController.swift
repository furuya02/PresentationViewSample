//
//  PresentationViewController.swift
//  PresentationViewSample
//
//  Created by hirauchi.shinichi on 2017/02/18.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class PresentationViewController: UIViewController {

    var imageName = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        
//        // 元のバックのビューは、とりあえず透明にする
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
//        
//        // UIVisualEffectViewを生成する
//        let visualEffectView = UIVisualEffectView(frame: view.frame)
//        visualEffectView.effect = UIBlurEffect(style: .regular)
//        // UIVisualEffectViewを他のビューの下に挿入する
//        view.insertSubview(visualEffectView, at: 0)
    }

    @IBAction func tapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

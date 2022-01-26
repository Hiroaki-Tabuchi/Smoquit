//
//  GameViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit
import SpriteKit
import CoreData

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //SKViewの作成
         if let skView = SKView(frame: self.view.frame) as SKView? {
             //SKViewにSKSceneを追加
             if let scene = GameScene(fileNamed: "GameScene") {
                 //SKSceneのサイズを設定
                 scene.scaleMode = .aspectFill
                 scene.viewController = self
                 //SKViewにSKSeenを追加
                 skView.presentScene(scene)
                 //UIViewにSKViewを追加
                 self.view.addSubview(skView)
             }
         }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  GameScene.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import Foundation
import SpriteKit
import UIKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    weak var viewController:UIViewController?
    
    let eatButton = UIButton()
    let maButton = UIButton()
    let stButton = UIButton()
    let baButton = UIButton()
    let countButton = UIButton()
    let exButton = UIButton()
    var gauge = UIProgressView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width/1.2, height:UIScreen.main.bounds.size.height/8))
    
    var charNode = SKSpriteNode(imageNamed: "char1.png")
    var backNode = SKSpriteNode(imageNamed: "bac1.png")
    var foodNode = SKSpriteNode(imageNamed: "dog.png")
    let bgUI = UIColor(hex:"7d4000")
    let liUI = UIColor.black
    var font = "Genkaimincho"
    var exL1 = SKLabelNode(fontNamed:"Genkaimincho")
    var exL2 = SKLabelNode(fontNamed:"Genkaimincho")
    var exL = SKLabelNode(fontNamed:"Genkaimincho")
    var xEx = SKLabelNode(fontNamed:"Genkaimincho")
    var exFrame:SKShapeNode! = nil
    var fText = SKLabelNode(fontNamed:"Genkaimincho")
    var rec1:SKSpriteNode! = nil
    var rec2:SKSpriteNode! = nil
    
    var request:UNNotificationRequest!
    var sound:AVAudioPlayer!
    var bgm:AVAudioPlayer!
    var soundButton:AVAudioPlayer!
    var effect1:[SKTexture] = []
    var effect2:[SKTexture] = []
    
    var stFrame:SKShapeNode! = nil
    var xStatus = SKLabelNode(fontNamed: "Genkaimincho")
    var stLabel = SKLabelNode(fontNamed: "Genkaimincho")
    var stCont = SKLabelNode(fontNamed: "Genkaimincho")
    
    //Timer()を設定
    var gaugeTimer = Timer()
    var charTD = 1
    let tDLabel = SKLabelNode(fontNamed:"Genkaimincho")
    var tDay = 1
    var level = 1
    var charName = "char1"
    var reDay = 0.0
    var failure = 0
    var goalDay = 0
    //トップ画面の設計
    override func didMove(to view: SKView) {
      exL1 = SKLabelNode(fontNamed:font)
      exL2 = SKLabelNode(fontNamed:font)
      exL = SKLabelNode(fontNamed:font)
      xEx = SKLabelNode(fontNamed:font)
      fText = SKLabelNode(fontNamed:font)
        xStatus = SKLabelNode(fontNamed:font)
        stLabel = SKLabelNode(fontNamed:font)
        stCont = SKLabelNode(fontNamed:font)
        //ゲームエフェクト
        for i in 0...19{
            effect1.append(SKTexture(imageNamed:"Rec2" + String(i) + ".png"))
        }
        
        for j in 0...19{
            effect2.append(SKTexture(imageNamed:"Rec1" + String(j+1) + ".png"))
        }
        
        //BGM
        let bgmArray = ["bgm1","bgm2","bgm3"]
        let bgmRandomSource = GKARC4RandomSource()
        let shuffledBGMArray = bgmRandomSource.arrayByShufflingObjects(in: bgmArray)
        bgm = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: (shuffledBGMArray[0] as! String), ofType: "mp3")!))
        bgm.play()
        bgm.numberOfLoops = -1
        
        // 日付フォーマット
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ja_JP")
        
        // 現在時刻の1分後に設定
        let date2 = Date(timeInterval: 10, since: date)
        let targetDate = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: date2)
        
        let dateString = dateFormatter.string(from: date2)
        print(dateString)
        
        // トリガーの作成
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: targetDate, repeats: false)
        
        // 通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "Smoquit Game"
        content.body = dateString
        content.sound = UNNotificationSound.default
        
        // 通知リクエストの作成
        request = UNNotificationRequest.init(
            identifier: "CalendarNotification",
            content: content,
            trigger: trigger)
        
        // 配置位置を決める
        backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        let bpW = backNode.frame.size.width
        let bpH = backNode.frame.size.height
        // サイズを変更
        backNode.size = CGSize(width: 800, height:800*bpH/bpW)
        self.addChild(backNode)

        charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        let cW = charNode.frame.size.width
        let cH = charNode.frame.size.height
        charNode.size = CGSize(width: 700, height: 700*cH/cW)
        self.addChild(charNode)


        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)

        let bW = self.size.width/4
        let bH = self.size.height/10.5
        
        if #available(iOS 15.0, *) {
            eatButton.configuration = nil
            maButton.configuration = nil
            stButton.configuration = nil
            baButton.configuration = nil
            countButton.configuration = nil
        }
        
        // 食事ボタンを生成.
        eatButton.frame = CGRect(x:self.size.width/150, y:self.size.height/2.45, width:bW, height:bH)
        eatButton.backgroundColor = bgUI
        eatButton.setTitle("食事", for: .normal)
        eatButton.titleLabel?.font = UIFont(name:font, size: 35)
        eatButton.setTitleColor(UIColor.white, for: .normal)
        eatButton.layer.cornerRadius = 20.0
        eatButton.layer.borderWidth = 8
        eatButton.layer.borderColor = liUI.cgColor
        eatButton.addTarget(self, action: #selector(onClickEatButton(sender:)), for: .touchUpInside)
        self.view!.addSubview(eatButton);
        
        // 魔法ボタンを生成.
        maButton.frame = CGRect(x:self.size.width/3.8, y:self.size.height/2.45, width:bW, height:bH)
        maButton.backgroundColor = bgUI
        maButton.setTitle("魔法", for: .normal)
        maButton.setTitleColor(UIColor.white, for: .normal)
        maButton.titleLabel?.font = UIFont(name:font, size: 35)
        maButton.layer.cornerRadius = 20.0
        maButton.layer.borderWidth = 8
        maButton.layer.borderColor = liUI.cgColor
        maButton.addTarget(self, action: #selector(onClickMagicButton(sender:)), for: .touchUpInside)
        self.view!.addSubview(maButton);
        
        // ステータスボタンを生成.
        stButton.frame = CGRect(x:self.size.width/150, y:self.size.height/1.95, width:bW, height:bH)
        stButton.backgroundColor = bgUI
        stButton.setTitle("ステータス", for: .normal)
        stButton.setTitleColor(UIColor.white, for: .normal)
        stButton.titleLabel?.font = UIFont(name:font, size: 30)
        stButton.layer.cornerRadius = 20.0
        stButton.layer.borderWidth = 8
        stButton.layer.borderColor = liUI.cgColor
        stButton.addTarget(self, action: #selector(onClickStatusButton(sender:)), for: .touchUpInside)
        self.view!.addSubview(stButton);
        
        // 戻るボタンを生成.
        baButton.frame = CGRect(x:self.size.width/3.8, y:self.size.height/1.95, width:bW, height:bH)
        baButton.backgroundColor = bgUI
        baButton.setTitle("戻る", for: .normal)
        baButton.setTitleColor(UIColor.white, for: .normal)
        baButton.titleLabel?.font = UIFont(name:font, size: 35)
        baButton.layer.cornerRadius = 20.0
        baButton.layer.borderWidth = 8
        baButton.layer.borderColor = liUI.cgColor
        baButton.addTarget(self, action: #selector(clickBack(sender:)), for: .touchUpInside)
        self.view!.addSubview(baButton);
        
        //カウントボタンの生成
        countButton.frame = CGRect(x:self.size.width/2.5, y:self.size.height/3.4, width:self.size.width/9.5, height:self.size.height/20)
        countButton.backgroundColor = bgUI
        countButton.setTitle("+１", for: .normal)
        countButton.setTitleColor(UIColor.white, for: .normal)
        countButton.titleLabel?.font = UIFont(name:font, size: 27)
        countButton.layer.cornerRadius = 20.0
        countButton.layer.borderWidth = 6
        countButton.layer.borderColor = liUI.cgColor
        countButton.addTarget(self, action: #selector(onClickCountButton(sender:)), for: .touchUpInside)
        self.view!.addSubview(countButton);
        
        //説明ボタンの生成
        exButton.frame = CGRect(x:self.size.width/40, y:self.size.height/29, width:65, height:65)
        exButton.backgroundColor = bgUI
        exButton.setTitle("？", for: .normal)
        exButton.setTitleColor(UIColor.white, for: .normal)
        exButton.titleLabel?.font = UIFont(name:font, size: 40)
        exButton.layer.cornerRadius = 32.5
        exButton.layer.borderWidth = 6
        exButton.layer.borderColor = liUI.cgColor
        exButton.addTarget(self, action: #selector(onClickExplainButton(sender:)), for: .touchUpInside)
        self.view!.addSubview(exButton);

        //ゲージを生成
        gauge.trackTintColor = UIColor.white
        gauge.layer.position = CGPoint(x:self.size.width/3.8, y:self.size.height/2.7)
        gauge.layer.borderColor = liUI.cgColor
        // バーの高さを設定する(横に1.0倍,縦に2.0倍)
        gauge.transform = CGAffineTransform(scaleX: 1.1, y:14)
        gauge.layer.borderColor = UIColor.gray.cgColor
        gauge.layer.borderWidth = 0.3
        // アニメーションを付ける.
        gauge.setProgress(1.0, animated: true)
        self.view!.addSubview(gauge)
        //ゲージの色変化を表現
        if(gauge.progress > 0.5){
            gauge.progressTintColor = UIColor.green
        }
        else if(gauge.progress <= 0.5){
            gauge.progressTintColor = UIColor.yellow
        }
        else if(gauge.progress <= 0.2){
            gauge.progressTintColor = UIColor.red
        }
        //ゲージの減少
        if(charName == "char1"){
            goalDay = 31
            //約129600秒(36時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.gauge.progress -= 0.0000078
            }
        }
        else if(charName == "char2"){
            goalDay = 92
            //約259200秒(72時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.gauge.progress -= 0.0000039
            }
        }
        else if(charName == "char3"){
            goalDay = 183
            //約432000秒(120時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.gauge.progress -= 0.0000024
            }
        }
        else if(charName == "char4"){
            goalDay = 366
            //約691200秒(192時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.gauge.progress -= 0.0000015
            }
        }
        else if(charName == "char5"){
            goalDay = 548
            //約1036800秒(288時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.gauge.progress -= 0.000001
            }
        }
        else if(charName == "char6"){
            goalDay = 731
            //約1468800秒(408時間で０になる)
            self.gaugeTimer = Timer.scheduledTimer(withTimeInterval: 1468800, repeats: true) { (timer) in
                self.gauge.progress -= 0.0000007
            }
        }
        
        
        tDLabel.zPosition = 2
        tDLabel.text = "【Lv.\(level)】\(charTD)日目"
        tDLabel.fontSize = 70
        tDLabel.fontColor = bgUI
        tDLabel.position = CGPoint(x:self.size.width/9, y:self.size.height/2.6)
        addChild(tDLabel)

        //ゲーム失敗時
        if(gauge.progress == 0){
            fText.text = "禁煙 失敗"
            fText.fontSize = 140
            fText.fontColor = bgUI
            fText.position = CGPoint(x:self.frame.midX, y:self.frame.height/5)
            fText.zPosition = 2
            addChild(fText)
            self.removeChildren(in: [charNode])
            if(charName == "char1"){
                charNode = SKSpriteNode(imageNamed: "fchar1.png")
            }
            if(charName == "char2"){
                charNode = SKSpriteNode(imageNamed: "fchar2.png")
            }
            if(charName == "char3"){
                charNode = SKSpriteNode(imageNamed: "fchar3.png")
            }
            if(charName == "char4"){
                charNode = SKSpriteNode(imageNamed: "fchar4.png")
            }
            if(charName == "char5"){
                charNode = SKSpriteNode(imageNamed: "fchar5.png")
            }
            if(charName == "char6"){
                charNode = SKSpriteNode(imageNamed: "fchar6.png")
            }
            backNode.zPosition = 0
            charNode.zPosition = 1
            addChild(charNode)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [self] in
                charTD = 1
                charName = "char1"
                self.charNode = SKSpriteNode(imageNamed: "char1.png")
                failure += 1
                self.gauge.progress = 1.0
                self.level = 1
                //UserDefaultsに宣言内容のデータを保存
                UserDefaults.standard.set(failure,forKey: "game_failure")
                self.removeChildren(in: [fText])
                self.removeChildren(in: [charNode])
                backNode.zPosition = 0
                charNode.zPosition = 1
                addChild(charNode)
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["TimeInterval30"])
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["TimeIntervalG"])
            }
            
        }
        //レベルが変わり、日数・ゲージの初期化、キャラ名の変更
        //レベル１⇨２
        if(charName == "char2" && charTD == 31){
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charTD = 1
            gauge.progress = 1.0
            charName = "char2"
            charNode = SKSpriteNode(imageNamed: "char2.png")
            backNode = SKSpriteNode(imageNamed: "bac2.png")
            backNode.zPosition = 0
            charNode.zPosition = 1
            level += 1
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            //レベル＋１
        }
        //レベル２⇨３
        if(charName == "char2" && charTD == 92){
            charTD = 1
            gauge.progress = 1.0
            charName = "char3"
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char3.png")
            backNode = SKSpriteNode(imageNamed: "bac3.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            level += 1
        }
        //レベル３⇨４
        if(charName == "char3" && charTD == 183){
            charTD = 1
            gauge.progress = 1.0
            charName = "char4"
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char4.png")
            backNode = SKSpriteNode(imageNamed: "bac4.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            level += 1
        }
        //レベル４⇨５
        if(charName == "char4" && charTD == 366){
            charTD = 1
            gauge.progress = 1.0
            charName = "char5"
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char5.png")
            backNode = SKSpriteNode(imageNamed: "bac5.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            level += 1
        }
        //レベル５⇨６
        if(charName == "char5" && charTD == 548){
            charTD = 1
            gauge.progress = 1.0
            charName = "char6"
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char6.png")
            backNode = SKSpriteNode(imageNamed: "bac6.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            level += 1
        }
        //レベル６⇨
        if(charName == "char6" && charTD == 731){
            charTD = 1
            gauge.progress = 1.0
            charName = "char1"
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char1.png")
            backNode = SKSpriteNode(imageNamed: "bac1.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
            level += 1
            //最初に戻る
        }
        
        if(charName == "char1"){
            reDay = Double((1.0-gauge.progress)*2)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char1.png")
            backNode = SKSpriteNode(imageNamed: "bac1.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        if(charName == "char2"){
            reDay = Double((1.0-gauge.progress)*4)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char2.png")
            backNode = SKSpriteNode(imageNamed: "bac2.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        if(charName == "char3"){
            reDay = Double((1.0-gauge.progress)*6)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char3.png")
            backNode = SKSpriteNode(imageNamed: "bac3.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        if(charName == "char4"){
            reDay = Double((1.0-gauge.progress)*9)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char4.png")
            backNode = SKSpriteNode(imageNamed: "bac4.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        if(charName == "char5"){
            reDay = Double((1.0-gauge.progress)*14)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char5.png")
            backNode = SKSpriteNode(imageNamed: "bac5.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        if(charName == "char6"){
            reDay = Double((1.0-gauge.progress)*20)
            self.removeChildren(in: [charNode])
            self.removeChildren(in: [backNode])
            charNode = SKSpriteNode(imageNamed: "char6.png")
            backNode = SKSpriteNode(imageNamed: "bac6.png")
            backNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            backNode.zPosition = 0
            charNode.zPosition = 1
            let bpW = backNode.frame.size.width
            let bpH = backNode.frame.size.height
            // サイズを変更
            backNode.size = CGSize(width: 800, height:800*bpH/bpW)
            //self.addChild(backNode)

            charNode.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            let cW = charNode.frame.size.width
            let cH = charNode.frame.size.height
            charNode.size = CGSize(width: 700, height: 700*cH/cW)
            //self.addChild(charNode)
            addChild(charNode)
            addChild(backNode)
        }
        
        UserDefaults.standard.set(gauge.progress,forKey: "game_gauge")
        UserDefaults.standard.set(level,forKey: "game_level")
        UserDefaults.standard.set(charName,forKey: "game_char_name")
        UserDefaults.standard.set(charTD,forKey:"game_char_day")
        UserDefaults.standard.set(tDay,forKey: "game_total")
        UserDefaults.standard.set(reDay,forKey:"game_reday")
        UserDefaults.standard.set(failure,forKey: "game_failure")
        gauge.progress = Float(UserDefaults.standard.integer(forKey: "game_gauge"))
        level = UserDefaults.standard.integer(forKey: "game_level")
        charName = UserDefaults.standard.string(forKey: "game_char_name")!
        //charTD = UserDefaults.standard.integer(forKey:"game_char_day")
        //tDay = UserDefaults.standard.integer(forKey: "game_total")
        reDay = UserDefaults.standard.double(forKey:"game_reday")
        failure = UserDefaults.standard.integer(forKey: "game_failure")
    
        //３０分前になったら通知
        if((gauge.progress <= 0.01389 && charName == "char1") || (gauge.progress <= 0.00694 && charName == "char2") || (gauge.progress <= 0.004167 && charName == "char3") || (gauge.progress <= 0.002604 && charName == "char4") || (gauge.progress <= 0.001736 && charName == "char5") || (gauge.progress <= 0.001225 && charName == "char6")){
            // 通知リクエストの登録
            let content30 = UNMutableNotificationContent()
            let trigger30 = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            content30.title = "Smoquit Game"
            content30.body = "残り30分です！ゲームを開いてゲージを回復させましょう！"
            content30.sound = UNNotificationSound.default
           let request30 = UNNotificationRequest(identifier: "TimeInterval30", content: content30, trigger: trigger30)
            // 通知の登録
            UNUserNotificationCenter.current().add(request30, withCompletionHandler: nil)
        }
        
        
    }
    
    //「食事」ボタンの動作
    @objc internal func onClickEatButton(sender: UIButton){
        eatButton.isEnabled = false
        eatButton.backgroundColor = .gray
        
        //ボタン効果音
        soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
        soundButton.stop()
        soundButton.currentTime = 0
        soundButton.play()
        eatButton.isEnabled = false
        //ゲージ増やす
        if(self.gauge.progress <= 1.0){
            let eatGaugeArray = [0.2,0.4,0.3,0.25,0.45]
            let eatG = GKARC4RandomSource()
            let shuffledEatGaugeArray = eatG.arrayByShufflingObjects(in: eatGaugeArray)
            self.gauge.progress += shuffledEatGaugeArray[0] as! Float
        }
        if self.gauge.progress > 1.0 {
            self.gauge.progress = 1.0
        }
        UserDefaults.standard.set(gauge.progress,forKey: "game_gauge")
        //食べ物画像を追加
        let eatArray = ["food1.png","food2.png","food3.png","food4.png","food5.png","food6.png","food7.png","food8.png"]
        let arc4RandomSource = GKARC4RandomSource()
        let shuffledEatArray = arc4RandomSource.arrayByShufflingObjects(in: eatArray)
        foodNode = SKSpriteNode(imageNamed: shuffledEatArray[0] as! String)
        //イベント画像に変更
        // 配置位置を決める
        foodNode.position = CGPoint(x:self.frame.width/2, y:self.frame.midY)
        foodNode.zPosition = 3
        // サイズを変更
        foodNode.size = CGSize(width: self.frame.width/4, height: self.frame.height/6)
        // 画面上に移動するアクションの作成
        // （指定した位置（画面の上）まで0.5秒で移動させる）
        let move = SKAction.moveTo(x: self.frame.midX, duration: 1.0)
        // 削除するアクション
        let remove = SKAction.removeFromParent()
        // アクションを連続して動かす
        foodNode.run(SKAction.sequence([move, remove]))
        // ミサイルを画面に表示する
        addChild(foodNode)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            //効果画像
            rec1 = SKSpriteNode(texture: effect1[0])
            rec1.zPosition = 3
            //スケール
            rec1.setScale(5)
            rec1.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            //パラパラアニメのアクション
            let animation1 = SKAction.animate(with: effect1, timePerFrame: 0.04)
            rec1.run(SKAction.repeatForever(animation1))
            self.addChild(rec1)
            
            //効果音
            sound = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectSound1", ofType: "mp3")!))
            sound.stop()
            sound.currentTime = 0
            sound.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.76) { [self] in
                
                if rec1 == nil {
                    print("rec1 is nil")
                }
                
                if rec1 != nil{
                    self.removeChildren(in: [rec1])
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 86400.0) { [self] in
                    eatButton.isEnabled = true
                    eatButton.backgroundColor = UIColor(hex:"7d4000")
                }
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 86400.0) { [self] in
            eatButton.isEnabled = true
            eatButton.backgroundColor = UIColor(hex:"7d4000")
        }
        
    }
    
    //「魔法」ボタンの動作
    @objc func onClickMagicButton(sender : UIButton){
        maButton.isEnabled = false
        maButton.backgroundColor = .gray
        
        //ボタン効果音
        soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
        soundButton.stop()
        soundButton.currentTime = 0
        soundButton.play()
        maButton.isEnabled = false
        if(self.gauge.progress <= 1.0){
            //ゲージ増やす
            let refGaugeArray = [0.1,0.2,-0.3,0.25,0.4,0.05]
            let refG = GKARC4RandomSource()
            let shuffledRefGaugeArray = refG.arrayByShufflingObjects(in: refGaugeArray)
            self.gauge.progress += shuffledRefGaugeArray[0] as! Float
        }
        if self.gauge.progress > 1.0 {
            self.gauge.progress = 1.0
        }
        if self.gauge.progress < 0 {
            self.gauge.progress = 0
        }
        UserDefaults.standard.set(gauge.progress,forKey: "game_gauge")
        //効果画像
        rec2 = SKSpriteNode(texture: effect2[0])
        rec2.zPosition = 2
        //スケール
        rec2.setScale(4)
        rec2.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        //パラパラアニメのアクション
        let animation2 = SKAction.animate(with: effect2, timePerFrame: 0.04)
        rec2.run(SKAction.repeatForever(animation2))
        self.addChild(rec2)
        //効果音
        sound = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectSound2", ofType: "mp3")!))
        sound.stop()
        sound.currentTime = 0
        sound.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.76) { [self] in
            if rec2 == nil {
                print("rec2 is nil")
            }
            self.removeChildren(in: [rec2])
            DispatchQueue.main.asyncAfter(deadline: .now() + 43200.0) { [self] in
                maButton.isEnabled = true
                maButton.backgroundColor = UIColor(hex:"7d4000")
            }
        }
        
        
    }
    
    //「ステータス」ボタンの動作
    @objc func onClickStatusButton(sender : UIButton){
        //ボタン効果音
        soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
        soundButton.stop()
        soundButton.currentTime = 0
        soundButton.play()
        
        eatButton.backgroundColor = UIColor.clear
        eatButton.setTitleColor(UIColor.clear, for: .normal)
        maButton.backgroundColor = UIColor.clear
        maButton.setTitleColor(UIColor.clear, for: .normal)
        stButton.backgroundColor = UIColor.clear
        stButton.setTitleColor(UIColor.clear, for: .normal)
        baButton.backgroundColor = UIColor.clear
        baButton.setTitleColor(UIColor.clear, for: .normal)
        exButton.backgroundColor = UIColor.clear
        exButton.setTitleColor(UIColor.clear, for: .normal)
        countButton.backgroundColor = UIColor.clear
        countButton.setTitleColor(UIColor.clear, for: .normal)
        gauge.progressTintColor = UIColor.clear
        gauge.trackTintColor = UIColor.clear
        eatButton.layer.borderColor = UIColor.clear.cgColor
        maButton.layer.borderColor = UIColor.clear.cgColor
        stButton.layer.borderColor = UIColor.clear.cgColor
        baButton.layer.borderColor = UIColor.clear.cgColor
        exButton.layer.borderColor = UIColor.clear.cgColor
        countButton.layer.borderColor = UIColor.clear.cgColor
        gauge.layer.borderColor = UIColor.clear.cgColor
        
        //ステータス枠の生成
        stFrame = SKShapeNode(rectOf: CGSize(width: self.size.width/1.1, height: self.size.height/1.5))
        stFrame.fillColor = UIColor(hex:"7d4000")
        stFrame.position = CGPoint(x:self.frame.midX,y:self.frame.midY)
        stFrame.zPosition = 2
        self.addChild(stFrame)
        xStatus.text = "×"
        xStatus.fontSize = 60
        xStatus.fontColor = UIColor.white
        xStatus.position = CGPoint(x:self.size.width/2.8, y:self.size.height/3.5)
        xStatus.name = "xStatus"
        xStatus.zPosition = 3
        self.addChild(xStatus)
        stLabel.text = "＜ステータス＞"
        stLabel.fontSize = 70
        stLabel.fontColor = UIColor.white
        stLabel.position = CGPoint(x:self.frame.midX, y:self.size.height/4.2)
        stLabel.zPosition = 3
        self.addChild(stLabel)
        
        stCont.text = "・現在日数：\(UserDefaults.standard.integer(forKey: "game_char_day"))日\r\r・総累計日数：\(UserDefaults.standard.integer(forKey: "game_total"))日\r\r・レベル：\(UserDefaults.standard.integer(forKey: "game_level"))\r\r・失敗回数：\( UserDefaults.standard.integer(forKey: "game_failure"))回\r\r・ゲージ：残り\(UserDefaults.standard.integer(forKey: "game_reday"))日\r\r・禁煙成功まで\r  残り\(goalDay-UserDefaults.standard.integer(forKey: "game_char_day"))日"
        stCont.fontSize = 55
        stCont.numberOfLines = 0
        stCont.fontColor = UIColor.white
        stCont.position = CGPoint(x:self.frame.midX, y:-self.size.height/3.5)
        stCont.zPosition = 3
        self.addChild(stCont)
        
        
        
    }
    
    //「戻る」ボタンの動作
    @objc func clickBack(sender : UIButton){
        //ボタン効果音
        soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
        soundButton.stop()
        soundButton.currentTime = 0
        soundButton.play()
        //画面遷移
        if let theViewController = viewController {
            theViewController.performSegue(withIdentifier: "to_top", sender: self)
        }
        else{
            print("Property viewController is nil")
        }
    }
    
    @objc func onClickCountButton(sender : UIButton){
        countButton.isEnabled = false
        countButton.backgroundColor = .gray
        self.charTD += 1
        tDay += 1
        UserDefaults.standard.set(charTD,forKey:"game_char_day")
        UserDefaults.standard.set(tDay,forKey: "game_total")
        tDLabel.text = "【Lv.\(UserDefaults.standard.integer(forKey: "game_level"))】\(UserDefaults.standard.integer(forKey:"game_char_day"))日目"
        //効果画像
        rec1 = SKSpriteNode(texture: effect1[0])
        rec1.zPosition = 3
        //スケール
        rec1.setScale(5)
        rec1.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        //パラパラアニメのアクション
        let animationC = SKAction.animate(with: effect1, timePerFrame: 0.04)
        rec1.run(SKAction.repeatForever(animationC))
        self.addChild(rec1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.76) { [self] in
            
            if rec1 == nil {
                print("rec1 is nil")
            }
            
            if rec1 != nil{
                self.removeChildren(in: [rec1])
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 86400.0) { [self] in
            countButton.backgroundColor = UIColor(hex:"7d4000")
            countButton.isEnabled = true
            let contentG = UNMutableNotificationContent()
            let triggerG = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            contentG.title = "Smoquit Game"
            contentG.body = "ゲームを開いて日数を記録しましょう！"
            contentG.sound = UNNotificationSound.default
           let requestG = UNNotificationRequest(identifier: "TimeIntervalG", content: contentG, trigger: triggerG)
            // 通知の登録
            UNUserNotificationCenter.current().add(requestG, withCompletionHandler: nil)
            
        }
    }
    
    @objc func onClickExplainButton(sender : UIButton){
        
        eatButton.backgroundColor = UIColor.clear
        eatButton.setTitleColor(UIColor.clear, for: .normal)
        maButton.backgroundColor = UIColor.clear
        maButton.setTitleColor(UIColor.clear, for: .normal)
        stButton.backgroundColor = UIColor.clear
        stButton.setTitleColor(UIColor.clear, for: .normal)
        baButton.backgroundColor = UIColor.clear
        baButton.setTitleColor(UIColor.clear, for: .normal)
        gauge.progressTintColor = UIColor.clear
        gauge.trackTintColor = UIColor.clear
        exButton.backgroundColor = UIColor.clear
        exButton.setTitleColor(UIColor.clear, for: .normal)
        countButton.backgroundColor = UIColor.clear
        countButton.setTitleColor(UIColor.clear, for: .normal)
        eatButton.layer.borderColor = UIColor.clear.cgColor
        maButton.layer.borderColor = UIColor.clear.cgColor
        stButton.layer.borderColor = UIColor.clear.cgColor
        baButton.layer.borderColor = UIColor.clear.cgColor
        exButton.layer.borderColor = UIColor.clear.cgColor
        countButton.layer.borderColor = UIColor.clear.cgColor
        gauge.layer.borderColor = UIColor.clear.cgColor
        
        
        exFrame = SKShapeNode(rectOf: CGSize(width: self.size.width/1.1, height: self.size.height/1.5))
        exFrame.fillColor = UIColor(hex:"7d4000")
        exFrame.position = CGPoint(x:self.frame.midX,y:self.frame.midY)
        exFrame.zPosition = 2
        self.addChild(exFrame)
        xEx.text = "×"
        xEx.fontSize = 55
        xEx.fontColor = UIColor.white
        xEx.position = CGPoint(x:self.size.width/2.8, y:self.size.height/3.5)
        xEx.name = "xEx"
        xEx.zPosition = 3
        self.addChild(xEx)
        exL.text = "＜ゲームの使い方＞"
        exL.fontSize = 55
        exL.zPosition = 3
        exL.fontColor = UIColor.white
        exL.position = CGPoint(x:self.frame.midX, y:self.size.height/3.9)
        self.addChild(exL)
        exL1.text = "Smoquitのご利用ありがとうございます！\rここではゲームの説明をさせていただきま\rす。このゲームは異世界でキャラクターの\r禁煙を成功させる育成ゲームです。レベル\rごとにキャラクターや禁煙達成条件が変わ\rります。１日ごとに＋１ボタンで禁煙日数\rを記録しましょう。\rまた、ゲージが０になり禁煙に失敗すると\rキャラクターがモンスターに変身するので\r「食事」や「魔法」を使ってゲージが減ら\rないようにしましょう（ボタン使用に時間\r制限あり）。ただし、「魔法」を使用する\rと１０％の確率でゲージが減少するので注\r意してください。\rキャラクター達と一緒に禁煙を成功させま\rしょう！"
        exL2.text = "＜使用素材＞\r・音楽：魔王魂（https://maou.audio）\r・背景：出雲寺ぜんすけ\r・キャラクター：ジュエルセイバーFREE \r（http://www.jewel-s.jp/）\r・エフェクト：\r【作者】tktk【サイト名】Material Forward\r（https://materialforwardvfx.wixsi\rte.com/materialforward）"

        exL1.numberOfLines = 0
        exL2.numberOfLines = 0
        let fS = 30
        let midX = self.frame.midX
        let hi = self.size.height
        exL1.fontSize = CGFloat(fS)
        exL1.fontColor = UIColor.white
        exL1.position = CGPoint(x:midX, y:-hi/8)
        exL1.zPosition = 3
        self.addChild(exL1)
        exL2.fontSize = CGFloat(fS-5)
        exL2.fontColor = UIColor.white
        exL2.position = CGPoint(x:midX, y:-hi/3.25)
        exL2.zPosition = 3
        self.addChild(exL2)
        
    }
    
    //画面をタッチした際の動作
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチしたボタンによって処理を分ける
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if(node.name == "xEx"){
                //ボタン効果音
                soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
                soundButton.stop()
                soundButton.currentTime = 0
                soundButton.play()
                
                self.removeChildren(in: [exFrame,exL1,exL2,exL,xEx])
                
                eatButton.backgroundColor = bgUI
                eatButton.setTitleColor(UIColor.white, for: .normal)
                maButton.backgroundColor = bgUI
                maButton.setTitleColor(UIColor.white, for: .normal)
                stButton.backgroundColor = bgUI
                stButton.setTitleColor(UIColor.white, for: .normal)
                baButton.backgroundColor = bgUI
                baButton.setTitleColor(UIColor.white, for: .normal)
                if(gauge.progress > 0.5){
                    gauge.progressTintColor = UIColor.green
                }
                if(gauge.progress <= 0.5){
                    gauge.progressTintColor = UIColor.yellow
                }
                if(gauge.progress <= 0.2){
                    gauge.progressTintColor = UIColor.red
                }
                gauge.trackTintColor = UIColor.white
                exButton.backgroundColor = bgUI
                exButton.setTitleColor(UIColor.white, for: .normal)
                countButton.backgroundColor = bgUI
                countButton.setTitleColor(UIColor.white, for: .normal)
                eatButton.layer.borderColor = liUI.cgColor
                maButton.layer.borderColor = liUI.cgColor
                stButton.layer.borderColor = liUI.cgColor
                baButton.layer.borderColor = liUI.cgColor
                exButton.layer.borderColor = liUI.cgColor
                countButton.layer.borderColor = liUI.cgColor
                gauge.layer.borderColor = UIColor.gray.cgColor
            }
            
            if(node.name == "xStatus"){
                //ボタン効果音
                soundButton = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "effectButton", ofType: "mp3")!))
                soundButton.stop()
                soundButton.currentTime = 0
                soundButton.play()
                
                self.removeChildren(in: [stFrame,stLabel,xStatus,stCont])
                
                eatButton.backgroundColor = bgUI
                eatButton.setTitleColor(UIColor.white, for: .normal)
                maButton.backgroundColor = bgUI
                maButton.setTitleColor(UIColor.white, for: .normal)
                stButton.backgroundColor = bgUI
                stButton.setTitleColor(UIColor.white, for: .normal)
                baButton.backgroundColor = bgUI
                baButton.setTitleColor(UIColor.white, for: .normal)
                if(gauge.progress > 0.5){
                    gauge.progressTintColor = UIColor.green
                }
                if(gauge.progress <= 0.5){
                    gauge.progressTintColor = UIColor.yellow
                }
                if(gauge.progress <= 0.2){
                    gauge.progressTintColor = UIColor.red
                }
                gauge.trackTintColor = UIColor.white
                exButton.backgroundColor = bgUI
                exButton.setTitleColor(UIColor.white, for: .normal)
                countButton.backgroundColor = bgUI
                countButton.setTitleColor(UIColor.white, for: .normal)
                eatButton.layer.borderColor = liUI.cgColor
                maButton.layer.borderColor = liUI.cgColor
                stButton.layer.borderColor = liUI.cgColor
                baButton.layer.borderColor = liUI.cgColor
                exButton.layer.borderColor = liUI.cgColor
                countButton.layer.borderColor = liUI.cgColor
                gauge.layer.borderColor = UIColor.gray.cgColor
            }
            
        }
        
    }
    
    
    
    override func sceneDidLoad() {
        
    }
    
    
}

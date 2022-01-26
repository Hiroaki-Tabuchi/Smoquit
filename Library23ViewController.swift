//
//  Library23ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library23ViewController: UIViewController {

    //ボタン、ラベルの接続
            @IBOutlet weak var lib23Label: UILabel!
            @IBOutlet var exLabel: UILabel!
            @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //画面遷移
            @IBAction func backL2(_ sender: Any) {
                let storyboard: UIStoryboard = self.storyboard!
                let next = storyboard.instantiateViewController(withIdentifier:"Library2 View Controller")as! Library2ViewController
                self.present(next, animated: true, completion: nil)
            }
                    
            override func viewDidLoad() {
                super.viewDidLoad()
                // スクリーンサイズを取得
                let scrW:CGFloat = view.frame.size.width
                let scrH:CGFloat = view.frame.size.height
                let bgUI = UIColor(hex:"008000")
                let liUI = UIColor(hex:"1c1d1c")
                let font = "Chalk-JP"
                if #available(iOS 15.0, *) {
                    backButton.configuration = nil
                }
                self.view.backgroundColor = UIColor(hex: "e6e6e6")
                scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*2)
                scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
                scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
                scrollView.layer.borderColor = liUI.cgColor
                scrollView.layer.borderWidth = 2
                scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
        //ボタン、ラベルの表記設定
                backButton.setTitle("×",for: .normal)
                lib23Label.text = "3.禁煙後の体の変化"
                exLabel.text = "　禁煙を開始すると、自身の体に様々な身体の変化が現れます。また、禁煙の継続時間によって体に現れる変化が異なります。\r　禁煙開始直後、身体は喫煙による変化を元に戻そうとし始めます。つまり、タバコの煙から発生する有害物質の被害から回復しようとしているのです。20分後にはニコチンによって収縮した血管が元の状態に戻り、血圧・脈拍・体温が正常化を始めます。同時にこの時間から体内のニコチン減少によって集中力の低下やイライラなどの離脱症状が現れます。しかし、この症状は2〜7日がピークでその後段々と軽くなり消滅します。\r　8時間後には喫煙によって低下していた酸素濃度が上昇し、呼吸が楽になり運動能力が回復し始めます。そして24時間が経つ頃には心臓発作の危険性が低下すると共に、離脱症状が強くなり始めます。このあたりで喫煙欲求が高まるので、自分自身のためにも我慢し続けましょう。\r　2,3日後には嗅覚・味覚・胃の働きの正常化や離脱症状の緩和が起きます。この離脱症状を乗り切れば喫煙欲求とお別れすることができます。1,2週間後には睡眠の質が向上し、循環機能・肌質が改善されます。また、1〜9ヶ月後では離脱症状が大きく軽減され、インフルエンザや心筋梗塞などの病気のリスクも低下します。ここまで経過すれば禁煙の第一段階は成功と言えますが、「禁煙は簡単」という慣れと安易な考えにより喫煙の誘惑に負けないようにしましょう。\r　1〜4年後には体の機能が喫煙前の状態に大きく近づいています。しかし、この時期でも簡単に再喫煙しうるので注意しましょう。そして、5年後以降は肺がんのリスクがかなり低下しており、様々な病気にかかるリスクが非喫煙者のレベルまで近づきます。 \r　このように禁煙のメリットは大きく、どの年齢で開始しても大いに効果は現れます。\r\r＜参考文献＞\r・くにちか内科クリニック. \"禁煙後におきる体の変化\". くにちか内科クリニック. https://kunichika-naika.com/subject/after-nosmoking-change"
                
        //表題ラベルの表記設定
                lib23Label.frame = CGRect(x:0, y:0, width: scrW, height: 80)
                lib23Label.center = CGPoint(x: scrW/2, y: scrH/8)
                lib23Label.textAlignment = NSTextAlignment.center
                lib23Label.font = UIFont(name: font, size: 40)
                lib23Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
                lib23Label.layer.shadowOpacity = 0.4
                lib23Label.textColor = liUI
                
                exLabel.numberOfLines = 0
                exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*2)
                exLabel.center = CGPoint(x: scrW/2, y: scrH/1.1)
                exLabel.font = UIFont(name:font, size:20)
                exLabel.textColor = UIColor(hex:"1c1d1c")
                
        //ボタン「設定」の表記設定
                backButton.backgroundColor = bgUI.withAlphaComponent(0.7) 
                backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
                backButton.layer.borderWidth = 2 // 5
                backButton.layer.borderColor = liUI.cgColor  // 6
                backButton.layer.cornerRadius = 30  // 7
                backButton.layer.shadowOffset = CGSize(width: 6, height:6)  // 8
                backButton.layer.shadowOpacity = 0.5  // 9
                backButton.layer.shadowRadius = 10  // 10
                //backButton.layer.shadowColor = UIColor.gray.cgColor  //11
                backButton.frame = CGRect(x:0, y:0, width:60, height:60)
                backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
                backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            }

}

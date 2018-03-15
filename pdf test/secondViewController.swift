//
//  secondViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 12/28/17.
//  Copyright © 2017 Lena Ngungu. All rights reserved.
//

import UIKit
import PDFKit
import AudioToolbox
import AVFoundation

class secondViewController: UIViewController, PDFViewDelegate{
    @IBOutlet var secondView: PDFView!
    
    @IBOutlet var activityIndic: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    var pgNum: Int?
    var pgTitle: String?
    @IBOutlet var navBar: UINavigationBar!
    
    @IBOutlet var addToFavButton: UIBarButtonItem!
    var player : AVAudioPlayer?
    var favorites = [""]
    var checked = [""]
    var favTitle : String? 
    /*
     var pageChange : PDFPage!
     {
     didSet
     {
     view.reloadInputViews()
     print("page changed")
     }
     }
     
     */
    
    
    /*
     @available(iOS 11.0, *)
     public static let PDFViewVisiblePagesChanged: NSNotification.Name // Notification when the scroll view has scrolled into the bounds of a new page.
     }*/
    
    @IBAction func longPressAction(_ sender: Any) {
     
        //player?.play()
        //player?.play(atTime: .now())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let defaults = UserDefaults.standard
        /*
         if let favoritesDefaults : AnyObject = defaults.object(forKey: "favorites") as AnyObject {
         favorites = (favoritesDefaults as? [String])!
         }
         */
        if let favoritesDefaults : [String] = defaults.object(forKey: "favorites") as? [String]  {
            favorites = favoritesDefaults
        }
        
        //let path1 = URL(fileReferenceLiteralResourceName: "ANatural.mp3")
        //player = try! AVAudioPlayer(contentsOf: path1)
        
       
        if let checkedDefaults  : [String] = defaults.object(forKey: "checked") as? [String]  {
            checked = checkedDefaults
        }

        
        searchBar.alpha = 0
        let path = URL(fileReferenceLiteralResourceName: "PDF.pdf")
        secondView.document = PDFDocument(url: path)
        let points = CGPoint(x: 5.0, y: 0.0) // What's this!!? lol
        secondView.page(for: points, nearest: true)
        
        secondView.reloadInputViews()
        
        
        secondView.document?.page(at: 18)?.accessibilityValue = "create in me a pure heart"
        secondView.document?.page(at: 19)?.accessibilityValue = "be still and know i am god"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 24)?.accessibilityValue = "his love endures forever"
        secondView.document?.page(at: 27)?.accessibilityValue = "unto thee o lord"
        secondView.document?.page(at: 28)?.accessibilityValue = "the law of the lord"
        secondView.document?.page(at: 29)?.accessibilityValue = "the steadfast love of the lord"
        secondView.document?.page(at: 30)?.accessibilityValue = "i will call upon the lord"
        secondView.document?.page(at: 31)?.accessibilityValue = "humble yourself in the sight of the lord"
        secondView.document?.page(at: 32)?.accessibilityValue = "praise god"
        secondView.document?.page(at: 33)?.accessibilityValue = "shout for joy"
        secondView.document?.page(at: 34)?.accessibilityValue = "praise the lord"
        secondView.document?.page(at: 35)?.accessibilityValue = "o praise the lord"
        secondView.document?.page(at: 36)?.accessibilityValue = "rejoice in the law of the lord"
        secondView.document?.page(at: 37)?.accessibilityValue = "o lord our lord"
        secondView.document?.page(at: 39)?.accessibilityValue = "rejoice in the lord always i am not afraid" // two songs!!!! - HANDLE!!
        
        
        secondView.document?.page(at: 40)?.accessibilityValue = "how majestic is your name"
        secondView.document?.page(at: 41)?.accessibilityValue = "the lord’s my shepherd"
        secondView.document?.page(at: 44)?.accessibilityValue = "o increase my love"
        secondView.document?.page(at: 45)?.accessibilityValue = "kyrie eleison"
        secondView.document?.page(at: 47)?.accessibilityValue = "hallelujah"
        secondView.document?.page(at: 48)?.accessibilityValue = "lord of all"
        secondView.document?.page(at: 49)?.accessibilityValue = "men who dream"
        secondView.document?.page(at: 53)?.accessibilityValue = "o holy god"
        secondView.document?.page(at: 55)?.accessibilityValue = "great among the nations"
        secondView.document?.page(at: 57)?.accessibilityValue = "take a look at the mountain"
        secondView.document?.page(at: 58)?.accessibilityValue = "remember me"
        secondView.document?.page(at: 61)?.accessibilityValue = "be with me lord"
        secondView.document?.page(at: 64)?.accessibilityValue = "prayer for boldness"
        secondView.document?.page(at: 67)?.accessibilityValue = "always triumphant"
        secondView.document?.page(at: 69)?.accessibilityValue = "thank you lord"
        secondView.document?.page(at: 71)?.accessibilityValue = "stand in awe"
        secondView.document?.page(at: 72)?.accessibilityValue = "go and make disciples"
        secondView.document?.page(at: 74)?.accessibilityValue = "a stream in the desert"
        secondView.document?.page(at: 75)?.accessibilityValue = "god almighty reigns"
        secondView.document?.page(at: 77)?.accessibilityValue = "i hear god singing to me"
        secondView.document?.page(at: 81)?.accessibilityValue = "i need your love"
        
        
        secondView.document?.page(at: 83)?.accessibilityValue = "pray for the peace of jerusalem"
        secondView.document?.page(at: 85)?.accessibilityValue = "be strong take heart"
        secondView.document?.page(at: 86)?.accessibilityValue = "there’s power in the blood"
        secondView.document?.page(at: 87)?.accessibilityValue = "our god he is alive"
        secondView.document?.page(at: 88)?.accessibilityValue = "glorious things of thee are spoken"
        secondView.document?.page(at: 89)?.accessibilityValue = "sweet sweet spirit"
        secondView.document?.page(at: 90)?.accessibilityValue = "take my life and let it be"
        secondView.document?.page(at: 91)?.accessibilityValue = "standing on the promises"
        secondView.document?.page(at: 92)?.accessibilityValue = "where could i go"
        secondView.document?.page(at: 93)?.accessibilityValue = "victory in jesus"
        secondView.document?.page(at: 95)?.accessibilityValue = "the old rugged cross"
        secondView.document?.page(at: 96)?.accessibilityValue = "amazing grace"
        secondView.document?.page(at: 97)?.accessibilityValue = "a mighty fortress"
        secondView.document?.page(at: 98)?.accessibilityValue = "god moves in a mysterious way"
        secondView.document?.page(at: 99)?.accessibilityValue = "for those tears i died"
        secondView.document?.page(at: 101)?.accessibilityValue = "there is a habitation"
        secondView.document?.page(at: 102)?.accessibilityValue = "precious lord"
        secondView.document?.page(at: 103)?.accessibilityValue = "when the roll is called"
        secondView.document?.page(at: 104)?.accessibilityValue = "glory be to jesus"
        secondView.document?.page(at: 105)?.accessibilityValue = "hold to god’s unchanging hand"
        secondView.document?.page(at: 106)?.accessibilityValue = "god of our fathers"
        secondView.document?.page(at: 107)?.accessibilityValue = "send the light"
        secondView.document?.page(at: 108)?.accessibilityValue = "how sweet how heavenly"
        secondView.document?.page(at: 109)?.accessibilityValue = "my jesus i love thee"
        
        //start here
        secondView.document?.page(at: 110)?.accessibilityValue = "i am resolved"
        secondView.document?.page(at: 111)?.accessibilityValue = "shall we gather at the river"
        secondView.document?.page(at: 112)?.accessibilityValue = "peace perfect peace"
        secondView.document?.page(at: 113)?.accessibilityValue = "to god be the glory"
        secondView.document?.page(at: 114)?.accessibilityValue = "i know that my redeemer lives"
        secondView.document?.page(at: 115)?.accessibilityValue = "ten thousand angels"
        secondView.document?.page(at: 116)?.accessibilityValue = "we will glorify"
        secondView.document?.page(at: 117)?.accessibilityValue = "praise him praise him"
        secondView.document?.page(at: 118)?.accessibilityValue = "what can wash away my sin"
        secondView.document?.page(at: 119)?.accessibilityValue = "there is much to do"
        secondView.document?.page(at: 120)?.accessibilityValue = "when i survey the wondrous cross"
        secondView.document?.page(at: 121)?.accessibilityValue = "this world is not my home"
        secondView.document?.page(at: 122)?.accessibilityValue = "rise up o men of god"
        secondView.document?.page(at: 123)?.accessibilityValue = "what a fellowship"
        secondView.document?.page(at: 124)?.accessibilityValue = "years i spent in vanity and pride"
        secondView.document?.page(at: 125)?.accessibilityValue = "how great thou art"
        secondView.document?.page(at: 126)?.accessibilityValue = "make me a channel of your peace"
        secondView.document?.page(at: 127)?.accessibilityValue = "we’ll work till jesus comes"
        secondView.document?.page(at: 128)?.accessibilityValue = "what a friend we have in jesus"
        secondView.document?.page(at: 129)?.accessibilityValue = "this is my father’s world"
        secondView.document?.page(at: 130)?.accessibilityValue = "to cannan’s land i’m on my way"
        secondView.document?.page(at: 131)?.accessibilityValue = "there is a place of quiet rest"
        secondView.document?.page(at: 132)?.accessibilityValue = "the spacious firmamen on high"
        secondView.document?.page(at: 133)?.accessibilityValue = "holy father the lord bless you and keep you" //TWO SONGS!!!
        
        secondView.document?.page(at: 135)?.accessibilityValue = "when we all get to heaven"
        secondView.document?.page(at: 136)?.accessibilityValue = "why did my savior come to earth"
        secondView.document?.page(at: 137)?.accessibilityValue = "the glory land way"
        secondView.document?.page(at: 138)?.accessibilityValue = "stand up stand up for jesus"
        secondView.document?.page(at: 139)?.accessibilityValue = "redeemed"
        secondView.document?.page(at: 140)?.accessibilityValue = "spirit of the living god"
        secondView.document?.page(at: 141)?.accessibilityValue = "ring out the message"
        secondView.document?.page(at: 143)?.accessibilityValue = "nearer still nearer"
        secondView.document?.page(at: 144)?.accessibilityValue = "purer in heart"
        secondView.document?.page(at: 145)?.accessibilityValue = "onward christian soldires"
        secondView.document?.page(at: 146)?.accessibilityValue = "immortal invisible god only wise"
        secondView.document?.page(at: 147)?.accessibilityValue = "no tears in heaven"
        secondView.document?.page(at: 148)?.accessibilityValue = "o scared head"
        secondView.document?.page(at: 149)?.accessibilityValue = "when the morning comes"
        secondView.document?.page(at: 150)?.accessibilityValue = "tis midnight and on olive’s brow"
        secondView.document?.page(at: 151)?.accessibilityValue = "on zion’s glorious summit"
        //start here
        secondView.document?.page(at: 152)?.accessibilityValue = "o master let me walk with thee"
        secondView.document?.page(at: 153)?.accessibilityValue = "love lifted me"
        secondView.document?.page(at: 154)?.accessibilityValue = "lord we come before thee now"
        secondView.document?.page(at: 155)?.accessibilityValue = "lo what a glorious sight"
        secondView.document?.page(at: 156)?.accessibilityValue = "lamb of god"
        secondView.document?.page(at: 157)?.accessibilityValue = "i love to tell the story"
        secondView.document?.page(at: 158)?.accessibilityValue = "jesus keep me near"
        secondView.document?.page(at: 159)?.accessibilityValue = "i’ll be a friend to jesus"
        secondView.document?.page(at: 160)?.accessibilityValue = "lead me to some soul today"
        secondView.document?.page(at: 161)?.accessibilityValue = "i’ll fly away"
        secondView.document?.page(at: 162)?.accessibilityValue = "jesus is lord"
        secondView.document?.page(at: 163)?.accessibilityValue = "jesus loves me"
        secondView.document?.page(at: 164)?.accessibilityValue = "i know whom i have believed"
        secondView.document?.page(at: 165)?.accessibilityValue = "i walk with the king"
        secondView.document?.page(at: 167)?.accessibilityValue = "trust and obey"
        secondView.document?.page(at: 168)?.accessibilityValue = "heavenly sunlight"
        secondView.document?.page(at: 169)?.accessibilityValue = "lead me to calvary"
        secondView.document?.page(at: 170)?.accessibilityValue = "i need thee every hour"
        secondView.document?.page(at: 171)?.accessibilityValue = "alas and did my savior bleed"
        secondView.document?.page(at: 172)?.accessibilityValue = "have thine own way"
        secondView.document?.page(at: 173)?.accessibilityValue = "hallelujah oraise jehovah"
        secondView.document?.page(at: 175)?.accessibilityValue = "faith is the victory"
        secondView.document?.page(at: 176)?.accessibilityValue = "there’s not a friend" //COULD BE CHANGED TO "THERE IS NOT A FRIEND"
        secondView.document?.page(at: 177)?.accessibilityValue = "great is thy faithfulness"
        secondView.document?.page(at: 179)?.accessibilityValue = "crown him with many crowns"
        secondView.document?.page(at: 180)?.accessibilityValue = "o worship the king"
        secondView.document?.page(at: 181)?.accessibilityValue = "follow me"
        secondView.document?.page(at: 183)?.accessibilityValue = "sanctuary"
        secondView.document?.page(at: 184)?.accessibilityValue = "sing hallelujah to the lord"
        secondView.document?.page(at: 185)?.accessibilityValue = "holy holy holy"
        
        secondView.document?.page(at: 186)?.accessibilityValue = "how firm a foundation"
        secondView.document?.page(at: 187)?.accessibilityValue = "soldiers of christ arise"
        secondView.document?.page(at: 188)?.accessibilityValue = "awesome god"
        secondView.document?.page(at: 189)?.accessibilityValue = "seek ye first"
        secondView.document?.page(at: 190)?.accessibilityValue = "there’s a fountain free"
        secondView.document?.page(at: 191)?.accessibilityValue = "just a little talk with jesus"
        secondView.document?.page(at: 193)?.accessibilityValue = "i will sing the wondrous story"
        secondView.document?.page(at: 194)?.accessibilityValue = "hallelujah what a savior"
        secondView.document?.page(at: 195)?.accessibilityValue = "blessed assurance"
        secondView.document?.page(at: 196)?.accessibilityValue = "christ the lord is risen today"
        secondView.document?.page(at: 197)?.accessibilityValue = "fairest lord jesus"
        secondView.document?.page(at: 198)?.accessibilityValue = "beneath the cross of jesus"
        secondView.document?.page(at: 199)?.accessibilityValue = "teach me lord to wait"
        secondView.document?.page(at: 201)?.accessibilityValue = "it is well with my soul"
        
        secondView.document?.page(at: 202)?.accessibilityValue = "when my love to christ"
        secondView.document?.page(at: 203)?.accessibilityValue = "glory glory halleleujah"
        secondView.document?.page(at: 205)?.accessibilityValue = "we’re marching to zion"
        secondView.document?.page(at: 206)?.accessibilityValue = "i’m not ashamed to own my lord"
        secondView.document?.page(at: 207)?.accessibilityValue = "we praise thee o god"
        secondView.document?.page(at: 208)?.accessibilityValue = "i know that my redeemer lives"
        secondView.document?.page(at: 209)?.accessibilityValue = "my hope is built"
        secondView.document?.page(at: 210)?.accessibilityValue = "joyful joyful we adore thee"
        secondView.document?.page(at: 211)?.accessibilityValue = "be still my soul"
        secondView.document?.page(at: 212)?.accessibilityValue = "i will speak"
        secondView.document?.page(at: 213)?.accessibilityValue = "my god and i"
        secondView.document?.page(at: 214)?.accessibilityValue = "breathe on me breath of god"
        secondView.document?.page(at: 215)?.accessibilityValue = "low in the grave he lay"
        secondView.document?.page(at: 216)?.accessibilityValue = "for the beauty of the earth"
        secondView.document?.page(at: 217)?.accessibilityValue = "just as i am"
        secondView.document?.page(at: 218)?.accessibilityValue = "just a closer walk with thee"
        secondView.document?.page(at: 219)?.accessibilityValue = "arise my sould arise"
        secondView.document?.page(at: 220)?.accessibilityValue = "all to jesus i surrender"
        secondView.document?.page(at: 221)?.accessibilityValue = "christ we do all adore thee"
        secondView.document?.page(at: 222)?.accessibilityValue = "all hail the power"
        secondView.document?.page(at: 223)?.accessibilityValue = "lord speak to me"
        secondView.document?.page(at: 224)?.accessibilityValue = "abide with me"
        secondView.document?.page(at: 225)?.accessibilityValue = "o come all ye faithful"
        
        secondView.document?.page(at: 226)?.accessibilityValue = "o come o come emmanuel"
        secondView.document?.page(at: 227)?.accessibilityValue = "joy to the world"
        secondView.document?.page(at: 228)?.accessibilityValue = "it came upon the midnight clear"
        secondView.document?.page(at: 229)?.accessibilityValue = "angels we have heard on high "
        secondView.document?.page(at: 231)?.accessibilityValue = "what child is this"
        secondView.document?.page(at: 232)?.accessibilityValue = "silent night"
        secondView.document?.page(at: 233)?.accessibilityValue = "hark the herald angels sing"
        secondView.document?.page(at: 236)?.accessibilityValue = "lord i thank you"
        secondView.document?.page(at: 237)?.accessibilityValue = "lord god almighty"
        secondView.document?.page(at: 239)?.accessibilityValue = "run to the fight"
        secondView.document?.page(at: 240)?.accessibilityValue = "siku rin wana"
        secondView.document?.page(at: 241)?.accessibilityValue = "the glory song"
        secondView.document?.page(at: 243)?.accessibilityValue = "in the kingdom"
        secondView.document?.page(at: 245)?.accessibilityValue = "thank you lord"
        secondView.document?.page(at: 246)?.accessibilityValue = "amen"
        secondView.document?.page(at: 247)?.accessibilityValue = "crossing over"
        secondView.document?.page(at: 248)?.accessibilityValue = "e khaya e-khaya"
        secondView.document?.page(at: 249)?.accessibilityValue = "encourage my soul"
        secondView.document?.page(at: 251)?.accessibilityValue = "don’t you wanna go"
        secondView.document?.page(at: 252)?.accessibilityValue = "god is so good"
        secondView.document?.page(at: 253)?.accessibilityValue = "he gave her water"
        secondView.document?.page(at: 257)?.accessibilityValue = "hard fighting soldier"
        secondView.document?.page(at: 258)?.accessibilityValue = "he is lord"
        
        secondView.document?.page(at: 259)?.accessibilityValue = "i am a poor wayfaring stranger"
        secondView.document?.page(at: 260)?.accessibilityValue = "glory glory"
        secondView.document?.page(at: 261)?.accessibilityValue = "i can’t keep it to myself"
        secondView.document?.page(at: 263)?.accessibilityValue = "his eye is on the sparrow"
        secondView.document?.page(at: 264)?.accessibilityValue = "i feel good"
        secondView.document?.page(at: 265)?.accessibilityValue = "i want jesus to walk with me"
        secondView.document?.page(at: 266)?.accessibilityValue = "i have decided to follow jesus"
        secondView.document?.page(at: 267)?.accessibilityValue = "i’ll be listening"
        secondView.document?.page(at: 268)?.accessibilityValue = "i’m coming up lord"
        secondView.document?.page(at: 269)?.accessibilityValue = "jesus will fix it"
        secondView.document?.page(at: 271)?.accessibilityValue = "let your living water flow"
        secondView.document?.page(at: 272)?.accessibilityValue = "let us break bread together"
        secondView.document?.page(at: 273)?.accessibilityValue = "i love to praise his holy name"
        secondView.document?.page(at: 275)?.accessibilityValue = "love love love"
        secondView.document?.page(at: 276)?.accessibilityValue = "there is a balm in gilead"
        secondView.document?.page(at: 277)?.accessibilityValue = "i’ve been redeemed"
        secondView.document?.page(at: 278)?.accessibilityValue = "oh how i love jesus"
        secondView.document?.page(at: 279)?.accessibilityValue = "sing amen amen"
        secondView.document?.page(at: 280)?.accessibilityValue = "sign me up"
        secondView.document?.page(at: 281)?.accessibilityValue = "jordan river"
        secondView.document?.page(at: 282)?.accessibilityValue = "someday"
        secondView.document?.page(at: 283)?.accessibilityValue = "soon and very soon"
        secondView.document?.page(at: 284)?.accessibilityValue = "swing low sweet chariot"
        
        secondView.document?.page(at: 285)?.accessibilityValue = "take the lord with you"
        secondView.document?.page(at: 287)?.accessibilityValue = "wade in the water"
        secondView.document?.page(at: 289)?.accessibilityValue = "where you there"
        secondView.document?.page(at: 290)?.accessibilityValue = "we shall overcome"
        secondView.document?.page(at: 291)?.accessibilityValue = "i tried and i tried would you be poured out like wine" // two ongs
        secondView.document?.page(at: 292)?.accessibilityValue = "walking on the heaven road"
        secondView.document?.page(at: 295)?.accessibilityValue = "amazing grace"
        secondView.document?.page(at: 297)?.accessibilityValue = "as many as possible"
        secondView.document?.page(at: 299)?.accessibilityValue = "glory glory hallelujah"
        secondView.document?.page(at: 301)?.accessibilityValue = "god alone"
        secondView.document?.page(at: 303)?.accessibilityValue = "create in me a pure heart"
        secondView.document?.page(at: 305)?.accessibilityValue = "jesus is lord"
        secondView.document?.page(at: 306)?.accessibilityValue = "hallelujah chorus"
        secondView.document?.page(at: 313)?.accessibilityValue = "all hail the power"
        secondView.document?.page(at: 316)?.accessibilityValue = "ain’t no rock"
        secondView.document?.page(at: 317)?.accessibilityValue = "we are soldiers in the army"
        secondView.document?.page(at: 318)?.accessibilityValue = "halalalalelujah deep down in my heart" // two songs
        secondView.document?.page(at: 319)?.accessibilityValue = "give me oil in my lamp"
        secondView.document?.page(at: 320)?.accessibilityValue = "his banner over me is love"
        
        secondView.document?.page(at: 321)?.accessibilityValue = "i tried and i tried i’m happy today"
        secondView.document?.page(at: 322)?.accessibilityValue = "this little light of mine i’m gonna view that holy city" //two songs
        secondView.document?.page(at: 323)?.accessibilityValue = "jesus loves the little children in my father’s house"
        secondView.document?.page(at: 324)?.accessibilityValue = "i’ve got the joy joy joy love love love" // two songs BUT love love love also in 276
        secondView.document?.page(at: 325)?.accessibilityValue = "the christian jubilee oh be careful"
        secondView.document?.page(at: 326)?.accessibilityValue = "my god is so great roll the gospel chariot"
        secondView.document?.page(at: 327)?.accessibilityValue = "rejoice in the lord always praise him praise him" // two songs
        secondView.document?.page(at: 328)?.accessibilityValue = "peace like a river whose side are you fighting on" //two songs
        secondView.document?.page(at: 329)?.accessibilityValue = "rise and shine"
        secondView.document?.page(at: 330)?.accessibilityValue = "standing in the need of prayer"
        secondView.document?.page(at: 331)?.accessibilityValue = "the new testament song"
        secondView.document?.page(at: 332)?.accessibilityValue = "show me the way the sea of galilee" //two songs
        secondView.document?.page(at: 333)?.accessibilityValue = "this is the day this is my commandment" //two songs
        secondView.document?.page(at: 334)?.accessibilityValue = "the wise man"
        secondView.document?.page(at: 335)?.accessibilityValue = "king of the jungle"
        secondView.document?.page(at: 336)?.accessibilityValue = "i’m in the lord’s army building up the kingdom"
        secondView.document?.page(at: 337)?.accessibilityValue = "jesus is well and alive today"
        
        if (favTitle != nil)
        {
            favTitle = favTitle?.lowercased()
            var pages = 0
            var myPage = secondView.document?.page(at: 0)
            //while (((myPage!.accessibilityValue?.hasPrefix(title) != true) && (pages != 339))
            while ((myPage!.accessibilityValue != favTitle) && (pages != 339)) {
                //add loading indicator !!
                secondView.goToNextPage(self)
                myPage = secondView.currentPage
                pages += 1
            }
        }
        else
        {
            secondView.go(to: secondView.document!.page(at: 18)!)
            
        }
    }
    /*
     NotificationCenter.default.addObserver(self, selector: Selector(favFunc()), name: Notification.Name.PDFViewPageChanged, object: (Any).self) // This goes in viewDidload
     
     }
     func favFunc() -> String
     {
     print(secondView.currentPage?.accessibilityValue as Any)
     return ("true")
     }
     */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchAction(_ sender: Any) {
        navBar.alpha = 0
        searchBar.alpha = 1
        // Make keyboard appear?? 
    }
    
    
    @IBAction func addToFavAction(_ sender: Any) {
        let current = secondView.currentPage
        
        if ((current?.accessibilityValue != nil) && (favorites.contains((current?.accessibilityValue)!) != true))
        {
            favorites.append((current?.accessibilityValue)!)
            checked.append("false")
            Toast(context: self, msg: "Added to favorites")
        }
            
        else if ((current?.accessibilityValue != nil) && (favorites.contains((current?.accessibilityValue)!) == true))
        {
            let index = favorites.index(of: (current?.accessibilityValue)!)
            favorites.remove(at: index!)
            checked.remove(at: index!)
            Toast(context: self, msg: "Removed from favorites")
        }
        
        let defaults = UserDefaults.standard // 1
        
        defaults.set(favorites, forKey: "favorites")
        defaults.set(checked, forKey: "checked")
        defaults.synchronize()
        
        
        
        
        
        /*
         if current?.accessibilityValue is not in array
         {
         favorites.append(current?.accessibilityValue)
         // change button to lit
         }
         else
         { // get index in array and
         favorites.remove(at: <#T##Int#>)
         //chnage button to unlit
         }
         */
    }
    func Toast(context ctx: UIViewController, msg: String) {
        
        let toast = UILabel(frame:
            CGRect(x: 25, y: ctx.view.frame.size.height / 2,
                   width: ctx.view.frame.size.width - 50, height: 50))
        
        toast.backgroundColor = UIColor.lightGray
        toast.textColor = UIColor.white
        toast.textAlignment = .center;
        toast.numberOfLines = 1
        toast.font = UIFont.systemFont(ofSize: 15)
        toast.layer.cornerRadius = 20;
        toast.clipsToBounds  =  true
        
        toast.text = msg
        
        ctx.view.addSubview(toast)
        
        UIView.animate(withDuration: 2.0, delay: 0.5,
                       options: .curveEaseOut, animations: {
                        toast.alpha = 0.0
        }, completion: {(isCompleted) in
            toast.removeFromSuperview()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toFav"
        {
            let destinatiionVC = segue.destination as! FavoritesViewController
            destinatiionVC.favorites = favorites
            destinatiionVC.checked = checked
            destinatiionVC.segueFrom = "songs"
        }
      
        
    }
    
    @IBAction func unwindToSecondViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    
    
    @IBAction func swipeActionRecog(_ sender: Any) {
        view.reloadInputViews()
        print("page changed")
    }
    
    @IBAction func tapActionRecog(_ sender: Any) {
        searchBar.endEditing(true)
        searchBar.alpha = 0
        navBar.alpha = 1
        
        secondView.clearSelection()
      //  player?.stop()
        
    }
    
    func navThroughPages()
    {
        
    }
    
    
}


extension secondViewController: UISearchBarDelegate{
    // searchBarTextDidEndEditing
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var pages = 0
        let songTitle = searchBar.text!
        
        print(songTitle)
        let currentPage = secondView.currentPage
        var myPage = secondView.document?.page(at: 0)
        
        activityIndic.center = self.view.center
        activityIndic.hidesWhenStopped = true
        
        self.view.addSubview(activityIndic)
        activityIndic.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05 ){
            //sleep(2)
            self.secondView.goToFirstPage(self)
            
            
            // while ((myPage!.accessibilityValue?.range(of: songTitle.lowercased())) == nil) // Make sure it's the first part
            // while (pageValue!.starts(with: songTitle.lowercased()) == false)
            
            
            // activityIndic.startAnimating()
            while (((myPage!.accessibilityValue?.hasPrefix(songTitle.lowercased())) != true) && (pages != 339))
            {
                
                
                //add loading indicator !!
                self.secondView.goToNextPage(self)
                myPage = self.secondView.currentPage
                pages += 1
                
                // dismiss keyboard
                //Tap recognition to dismiss search bar and keyboard !!
                
                
            }
            
            if (pages == 339)
            {
                self.secondView.go(to: currentPage!)
                
            }
            searchBar.alpha = 0
            self.navBar.alpha = 1
            self.activityIndic.stopAnimating()
            
        }
        
    }
    
    
    
    
}



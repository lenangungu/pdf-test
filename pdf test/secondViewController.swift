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
//import iOSDropDown

class secondViewController: UIViewController, PDFViewDelegate{
    
    @IBOutlet var secondView: PDFView!
    
    @IBOutlet var activityIndic: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    var pgNum: Int?
    var pgTitle: String?
    @IBOutlet var navBar: UINavigationBar!
    
    @IBOutlet var addToFavButton: UIBarButtonItem!
    @IBOutlet var searchSongTableView: UITableView!
    //var player : AVAudioPlayer?
    var favorites = [""]
    var checked = [""]
    var allSongs = ["create in me a pure heart (1)",    "be still and know i am god (2)",    "have you not heard (3)",    "his love endures forever (4)",    "unto thee o lord (100)",    "the law of the lord (101)",    "the steadfast love of the lord (102)",    "i will call upon the lord (103)",    "humble yourself in the sight of the lord (104)",    "praise god (105)",    "shout for joy (106)",    "praise the lord (107)",    "o praise the lord (108)",    "rejoice in the law of the lord (109)",    "o lord our lord (110)",    "rejoice in the lord always (111)" ,    "i am not afraid (112)",    "how majestic is your name (113)",    "the lord’s my shepherd (114)",    "o increase my love (200)",    "kyrie eleison (201)",    "hallelujah (202)",    "lord of all (203)",    "men who dream (204)",    "o holy god (205)",    "great among the nations (206)",    "take a look at the mountain (207)",    "remember me (208)",    "be with me lord (209)",    "prayer for boldness (210)",    "always triumphant (211)",    "thank you lord (212)",    "stand in awe (213)",    "go and make disciples (214)",    "a stream in the desert (215)",    "god almighty reigns (216)",    "i hear god singing to me (217)",    "i need your love (218)",    "pray for the peace of jerusalem (219)",    "be strong take heart (220)",    "there’s power in the blood (350)",    "our god he is alive (351)",    "glorious things of thee are spoken (352)",    "sweet sweet spirit (353)",    "take my life and let it be (354)",    "standing on the promises (355)",    "where could i go (356)",    "victory in jesus (357)",    "the old rugged cross (358)",    "amazing grace (359)",    "a mighty fortress (360)",    "god moves in a mysterious way (361)",    "for those tears i died (362)",     "there is a habitation (363)",     "precious lord (364)",     "when the roll is called (365)",     "glory be to Jesus (366)",     "hold to god’s unchanging hand (367)",     "god of our fathers (368)",     "send the light (369)",     "how sweet how heavenly (370)",     "my Jesus i love thee (371)",     "i am resolved (372)",     "shall we gather at the river (373)",     "peace perfect peace (374)",     "to god be the glory (375)",     "i know that my redeemer lives (376)",     "ten thousand angels (377)",     "we will glorify (378)",     "praise him praise him (379)",     "what can wash away my sin (380)",     "there is much to do (381)",     "when i survey the wondrous cross (382)",     "this world is not my home (383)",     "rise up o men of god (384)",     "what a fellowship (385)",     "years i spent in vanity and pride (386)",     "how great thou art (387)",     "make me a channel of your peace (388)",     "we’ll work till Jesus comes (389)",     "what a friend we have in jesus (390)",     "this is my father’s world (391)",     "to cannan’s land i’m on my way (392)",     "there is a place of quiet rest (393)",     "the spacious firmamen on high (394)",     "holy father (395)",     "the lord bless you and keep you (396)",     "when we all get to heaven (397)",     "why did my savior come to earth (398)",     "the glory land way (399)",     "stand up stand up for jesus (400)",     "redeemed (401)",     "spirit of the living god (402)",     "ring out the message (403)",     "nearer still nearer (404)",     "purer in heart (405)",     "onward christian soldires (406)",     "immortal invisible god only wise (407)",     "no tears in heaven (408)",     "o scared head (409)",     "when the morning comes (410)",     "tis midnight and on olive’s brow (411)",     "on zion’s glorious summit (412)",     "o master let me walk with thee (413)",     "love lifted me (414)",     "lord we come before thee now (415)",     "lo what a glorious sight (416)",     "lamb of god (417)",     "i love to tell the story (418)",     "Jesus keep me near (419)",     "i’ll be a friend to Jesus (420)",     "lead me to some soul today (421)",     "i’ll fly away (422)",     "jesus is lord (423)",     "jesus loves me (424)",     "i know whom i have believed (425)",     "i walk with the king (426)",     "trust and obey (427)",     "heavenly sunlight (428)",     "lead me to calvary (429)",     "i need thee every hour (430)",     "alas and did my savior bleed (431)",     "have thine own way (432)",     "hallelujah oraise Jehovah (433)",     "faith is the victory (434)",     "there’s not a friend (435)",     "great is thy faithfulness (436)",     "crown him with many crowns (437)",     "o worship the king (438)",     "follow me (439)",     "sanctuary (440)",     "sing hallelujah to the lord (441)",     "holy holy holy (442)",     "how firm a foundation (443)",     "soldiers of christ arise (444)",     "awesome god (445)",     "seek ye first (446)",     "there’s a fountain free (447)",     "just a little talk with Jesus (448)",     "i will sing the wondrous story (449)",     "hallelujah what a savior (450)",     "blessed assurance (451)",     "Christ the lord is risen today (452)",     "fairest lord Jesus (453)",     "beneath the cross of Jesus (454)",     "teach me lord to wait (455)",     "it is well with my soul (456)",     "when my love to Christ (457)",     "glory glory halleleujah (458)",     "we’re marching to zion (459)",     "i’m not ashamed to own my lord (460)",     "we praise thee o god (461)",     "i know that my redeemer lives (462)",     "my hope is built (463)",     "joyful joyful we adore thee (464)",     "be still my soul (465)",     "i will speak (466)",     "my god and i (467)",     "breathe on me breath of god (468)",     "low in the grave he lay (469)",     "for the beauty of the earth (470)",     "just as i am (471)",     "just a closer walk with thee (472)",     "arise my sould arise (473)",     "all to jesus i surrender (474)",     "christ we do all adore thee (475)",     "all hail the power (476)",     "lord speak to me (477)",     "abide with me (478)",     "o come all ye faithful (550)",     "o come o come emmanuel (551)",     "joy to the world (552)",     "it came upon the midnight clear (553)",     "angels we have heard on high (554)",     "what child is this (555)",     "silent night (556)",     "hark the herald angels sing (557)",     "lord i thank you (600)",     "lord god almighty (601)",     "run to the fight (602)",     "siku rin wana (603)",     "the glory song (604)",     "in the kingdom (605)",     "thank you lord (700)",     "amen (701)",     "crossing over (702)",     "e khaya e-khaya (703)",     "encourage my soul (704)",     "don’t you wanna go (705)",     "god is so good (706)",     "he gave her water (707)",     "hard fighting soldier (708)",     "he is lord (709)",     "i am a poor wayfaring stranger (710)",     "glory glory (711)",     "i can’t keep it to myself (712)",     "his eye is on the sparrow (713)",     "i feel good (714)",     "i want Jesus to walk with me (715)",     "i have decided to follow Jesus (716)",     "i’ll be listening (717)",     "i’m coming up lord (718)",     "jesus will fix it (719)",     "let your living water flow (720)",     "let us break bread together (721)",     "i love to praise his holy name (722)",     "love love love (723)",     "there is a balm in gilead (724)",     "i’ve been redeemed (725)",     "oh how i love Jesus (726)",     "sing amen amen (727)",     "sign me up (728)",     "jordan river (729)",     "someday (730)",     "soon and very soon (731)",     "swing low sweet chariot (732)",     "take the lord with you (733)",     "wade in the water (734)",     "where you there (735)",     "we shall overcome (736)",     "i tried and i tried (737)" ,     "would you be poured out like wine (738)",     "walking on the heaven road (739)",     "amazing grace (800)",     "as many as possible (801)",     "glory glory hallelujah (802)",     "god alone (803)",     "create in me a pure heart (804)",     "Jesus is lord (805)",     "hallelujah chorus (880)",     "all hail the power (881)",     "ain’t no rock (900)",     "we are soldiers in the army (901)",     "deep down in my heart (903)",     "halalalalelujah (902)",     "give me oil in my lamp (904)",     "his banner over me is love (905)",     "i tried and i tried (906)",     "i’m happy today (907)",     "this little light of mine (908)",     "i’m gonna view that holy city (909)",     "jesus loves the little children (910)",     "in my father’s house (911)",     "i’ve got the joy joy joy (912)",     "love love love (913)",     "the christian jubilee (914)",     "oh be careful (915)",     "my god is so great (916)",     "roll the gospel chariot (917)",     "rejoice in the lord always (918)" ,     "praise him praise him (919)",     "peace like a river (920)" ,     "whose side are you fighting on (921)",     "rise and shine (922)",     "standing in the need of prayer (923)",     "the new testament song (924)",     "show me the way (925)",     "the sea of galilee (926)",     "this is the day (927)" ,     "this is my commandment (928)",     "the wise man (929)",     "king of the jungle (930)",     "building up the kingdom (932)",     "i’m in the lord’s army (931)" ,     "jesus is well and alive today (933)",]
    
    var filteredSongs = [String]()
    var favTitle : String?
    var isSearching = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        let defaults = UserDefaults.standard
        
        if let favoritesDefaults : [String] = defaults.object(forKey: "favorites") as? [String]  {
            favorites = favoritesDefaults
        }
        
        //let path1 = URL(fileReferenceLiteralResourceName: "ANatural.mp3")
        //player = try! AVAudioPlayer(contentsOf: path1)
        
        if let checkedDefaults  : [String] = defaults.object(forKey: "checked") as? [String]  {
            checked = checkedDefaults
        }
        searchBar.alpha = 0
        setPages()
        
        // UIgraphicsEndImageContext()
        //  UIgraphicsPopContext()
        
    }
    
    
    
    func setPages()
    {
        let points = CGPoint(x: 5.0, y: 0.0)
        let path = URL(fileReferenceLiteralResourceName: "PDF.pdf")
        
        secondView.document = PDFDocument(url: path)
        secondView.page(for: points, nearest: true)
        
        
        
        secondView.document?.page(at: 18)?.accessibilityValue = "create in me a pure heart (1)"
        secondView.document?.page(at: 19)?.accessibilityValue = "be still and know i am god (2)"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard (3)"
        secondView.document?.page(at: 24)?.accessibilityValue = "his love endures forever (4)"
        secondView.document?.page(at: 27)?.accessibilityValue = "unto thee o lord (100)"
        secondView.document?.page(at: 28)?.accessibilityValue = "the law of the lord (101)"
        secondView.document?.page(at: 29)?.accessibilityValue = "the steadfast love of the lord (102)"
        secondView.document?.page(at: 30)?.accessibilityValue = "i will call upon the lord (103)"
        secondView.document?.page(at: 31)?.accessibilityValue = "humble yourself in the sight of the lord (104)"
        secondView.document?.page(at: 32)?.accessibilityValue = "praise god (105)"
        secondView.document?.page(at: 33)?.accessibilityValue = "shout for joy (106)"
        secondView.document?.page(at: 34)?.accessibilityValue = "praise the lord (107)"
        secondView.document?.page(at: 35)?.accessibilityValue = "o praise the lord (108)"
        secondView.document?.page(at: 36)?.accessibilityValue = "rejoice in the law of the lord (109)"
        secondView.document?.page(at: 37)?.accessibilityValue = "o lord our lord (110)"
        secondView.document?.page(at: 39)?.accessibilityValue = "rejoice in the lord always (111) ; i am not afraid (112)"
        
        
        secondView.document?.page(at: 40)?.accessibilityValue = "how majestic is your name (113)"
        secondView.document?.page(at: 41)?.accessibilityValue = "the lord’s my shepherd (114)"
        secondView.document?.page(at: 44)?.accessibilityValue = "o increase my love (200)"
        secondView.document?.page(at: 45)?.accessibilityValue = "kyrie eleison (201)"
        secondView.document?.page(at: 47)?.accessibilityValue = "hallelujah (202)"
        secondView.document?.page(at: 48)?.accessibilityValue = "lord of all (203)"
        secondView.document?.page(at: 49)?.accessibilityValue = "men who dream (204)"
        secondView.document?.page(at: 53)?.accessibilityValue = "o holy god (205)"
        secondView.document?.page(at: 55)?.accessibilityValue = "great among the nations (206)"
        secondView.document?.page(at: 57)?.accessibilityValue = "take a look at the mountain (207)"
        secondView.document?.page(at: 58)?.accessibilityValue = "remember me (208)"
        secondView.document?.page(at: 61)?.accessibilityValue = "be with me lord (209)"
        secondView.document?.page(at: 64)?.accessibilityValue = "prayer for boldness (210)"
        secondView.document?.page(at: 67)?.accessibilityValue = "always triumphant (211)"
        secondView.document?.page(at: 69)?.accessibilityValue = "thank you lord (212)"
        secondView.document?.page(at: 71)?.accessibilityValue = "stand in awe (213)"
        secondView.document?.page(at: 72)?.accessibilityValue = "go and make disciples (214)"
        secondView.document?.page(at: 74)?.accessibilityValue = "a stream in the desert (215)"
        secondView.document?.page(at: 75)?.accessibilityValue = "god almighty reigns (216)"
        secondView.document?.page(at: 77)?.accessibilityValue = "i hear god singing to me (217)"
        secondView.document?.page(at: 81)?.accessibilityValue = "i need your love (218)"
        
        
        secondView.document?.page(at: 83)?.accessibilityValue = "pray for the peace of jerusalem (219)"
        secondView.document?.page(at: 85)?.accessibilityValue = "be strong take heart (220)"
        secondView.document?.page(at: 86)?.accessibilityValue = "there’s power in the blood (350)"
        secondView.document?.page(at: 87)?.accessibilityValue = "our god he is alive (351)"
        secondView.document?.page(at: 88)?.accessibilityValue = "glorious things of thee are spoken (352)"
        secondView.document?.page(at: 89)?.accessibilityValue = "sweet sweet spirit (353)"
        secondView.document?.page(at: 90)?.accessibilityValue = "take my life and let it be (354)"
        secondView.document?.page(at: 91)?.accessibilityValue = "standing on the promises (355)"
        secondView.document?.page(at: 92)?.accessibilityValue = "where could i go (356)"
        secondView.document?.page(at: 93)?.accessibilityValue = "victory in jesus (357)"
        secondView.document?.page(at: 95)?.accessibilityValue = "the old rugged cross (358)"
        secondView.document?.page(at: 96)?.accessibilityValue = "amazing grace (359)"
        secondView.document?.page(at: 97)?.accessibilityValue = "a mighty fortress (360)"
        secondView.document?.page(at: 98)?.accessibilityValue = "god moves in a mysterious way (361)"
        secondView.document?.page(at: 99)?.accessibilityValue = "for those tears i died (362)"
        secondView.document?.page(at: 101)?.accessibilityValue = "there is a habitation (363)"
        secondView.document?.page(at: 102)?.accessibilityValue = "precious lord (364)"
        secondView.document?.page(at: 103)?.accessibilityValue = "when the roll is called (365)"
        secondView.document?.page(at: 104)?.accessibilityValue = "glory be to Jesus (366)"
        secondView.document?.page(at: 105)?.accessibilityValue = "hold to god’s unchanging hand (367)"
        secondView.document?.page(at: 106)?.accessibilityValue = "god of our fathers (368)"
        secondView.document?.page(at: 107)?.accessibilityValue = "send the light (369)"
        secondView.document?.page(at: 108)?.accessibilityValue = "how sweet how heavenly (370)"
        secondView.document?.page(at: 109)?.accessibilityValue = "my Jesus i love thee (371)"
        
        secondView.document?.page(at: 110)?.accessibilityValue = "i am resolved (372)"
        secondView.document?.page(at: 111)?.accessibilityValue = "shall we gather at the river (373)"
        secondView.document?.page(at: 112)?.accessibilityValue = "peace perfect peace (374)"
        secondView.document?.page(at: 113)?.accessibilityValue = "to god be the glory (375)"
        secondView.document?.page(at: 114)?.accessibilityValue = "i know that my redeemer lives (376)"
        secondView.document?.page(at: 115)?.accessibilityValue = "ten thousand angels (377)"
        secondView.document?.page(at: 116)?.accessibilityValue = "we will glorify (378)"
        secondView.document?.page(at: 117)?.accessibilityValue = "praise him praise him (379)"
        secondView.document?.page(at: 118)?.accessibilityValue = "what can wash away my sin (380)"
        secondView.document?.page(at: 119)?.accessibilityValue = "there is much to do (381)"
        secondView.document?.page(at: 120)?.accessibilityValue = "when i survey the wondrous cross (382)"
        secondView.document?.page(at: 121)?.accessibilityValue = "this world is not my home (383)"
        secondView.document?.page(at: 122)?.accessibilityValue = "rise up o men of god (384)"
        secondView.document?.page(at: 123)?.accessibilityValue = "what a fellowship (385)"
        secondView.document?.page(at: 124)?.accessibilityValue = "years i spent in vanity and pride (386)"
        secondView.document?.page(at: 125)?.accessibilityValue = "how great thou art (387)"
        secondView.document?.page(at: 126)?.accessibilityValue = "make me a channel of your peace (388)"
        secondView.document?.page(at: 127)?.accessibilityValue = "we’ll work till Jesus comes (389)"
        secondView.document?.page(at: 128)?.accessibilityValue = "what a friend we have in jesus (390)"
        secondView.document?.page(at: 129)?.accessibilityValue = "this is my father’s world (391)"
        secondView.document?.page(at: 130)?.accessibilityValue = "to cannan’s land i’m on my way (392)"
        secondView.document?.page(at: 131)?.accessibilityValue = "there is a place of quiet rest (393)"
        secondView.document?.page(at: 132)?.accessibilityValue = "the spacious firmamen on high (394)"
        secondView.document?.page(at: 133)?.accessibilityValue = "holy father (395) ; the lord bless you and keep you (396)"
        
        secondView.document?.page(at: 135)?.accessibilityValue = "when we all get to heaven (397)"
        secondView.document?.page(at: 136)?.accessibilityValue = "why did my savior come to earth (398)"
        secondView.document?.page(at: 137)?.accessibilityValue = "the glory land way (399)"
        secondView.document?.page(at: 138)?.accessibilityValue = "stand up stand up for jesus (400)"
        secondView.document?.page(at: 139)?.accessibilityValue = "redeemed (401)"
        secondView.document?.page(at: 140)?.accessibilityValue = "spirit of the living god (402)"
        secondView.document?.page(at: 141)?.accessibilityValue = "ring out the message (403)"
        secondView.document?.page(at: 143)?.accessibilityValue = "nearer still nearer (404)"
        secondView.document?.page(at: 144)?.accessibilityValue = "purer in heart (405)"
        secondView.document?.page(at: 145)?.accessibilityValue = "onward christian soldires (406)"
        secondView.document?.page(at: 146)?.accessibilityValue = "immortal invisible god only wise (407)"
        secondView.document?.page(at: 147)?.accessibilityValue = "no tears in heaven (408)"
        secondView.document?.page(at: 148)?.accessibilityValue = "o scared head (409)"
        secondView.document?.page(at: 149)?.accessibilityValue = "when the morning comes (410)"
        secondView.document?.page(at: 150)?.accessibilityValue = "tis midnight and on olive’s brow (411)"
        secondView.document?.page(at: 151)?.accessibilityValue = "on zion’s glorious summit (412)"
        
        secondView.document?.page(at: 152)?.accessibilityValue = "o master let me walk with thee (413)"
        secondView.document?.page(at: 153)?.accessibilityValue = "love lifted me (414)"
        secondView.document?.page(at: 154)?.accessibilityValue = "lord we come before thee now (415)"
        secondView.document?.page(at: 155)?.accessibilityValue = "lo what a glorious sight (416)"
        secondView.document?.page(at: 156)?.accessibilityValue = "lamb of god (417)"
        secondView.document?.page(at: 157)?.accessibilityValue = "i love to tell the story (418)"
        secondView.document?.page(at: 158)?.accessibilityValue = "Jesus keep me near (419)"
        secondView.document?.page(at: 159)?.accessibilityValue = "i’ll be a friend to Jesus (420)"
        secondView.document?.page(at: 160)?.accessibilityValue = "lead me to some soul today (421)"
        secondView.document?.page(at: 161)?.accessibilityValue = "i’ll fly away (422)"
        secondView.document?.page(at: 162)?.accessibilityValue = "jesus is lord (423)"
        secondView.document?.page(at: 163)?.accessibilityValue = "jesus loves me (424)"
        secondView.document?.page(at: 164)?.accessibilityValue = "i know whom i have believed (425)"
        secondView.document?.page(at: 165)?.accessibilityValue = "i walk with the king (426)"
        secondView.document?.page(at: 167)?.accessibilityValue = "trust and obey (427)"
        secondView.document?.page(at: 168)?.accessibilityValue = "heavenly sunlight (428)"
        secondView.document?.page(at: 169)?.accessibilityValue = "lead me to calvary (429)"
        secondView.document?.page(at: 170)?.accessibilityValue = "i need thee every hour (430)"
        secondView.document?.page(at: 171)?.accessibilityValue = "alas and did my savior bleed (431)"
        secondView.document?.page(at: 172)?.accessibilityValue = "have thine own way (432)"
        secondView.document?.page(at: 173)?.accessibilityValue = "hallelujah oraise Jehovah (433)"
        secondView.document?.page(at: 175)?.accessibilityValue = "faith is the victory (434)"
        secondView.document?.page(at: 176)?.accessibilityValue = "there’s not a friend (435)"
        secondView.document?.page(at: 177)?.accessibilityValue = "great is thy faithfulness (436)"
        secondView.document?.page(at: 179)?.accessibilityValue = "crown him with many crowns (437)"
        secondView.document?.page(at: 180)?.accessibilityValue = "o worship the king (438)"
        secondView.document?.page(at: 181)?.accessibilityValue = "follow me (439)"
        secondView.document?.page(at: 183)?.accessibilityValue = "sanctuary (440)"
        secondView.document?.page(at: 184)?.accessibilityValue = "sing hallelujah to the lord (441)"
        secondView.document?.page(at: 185)?.accessibilityValue = "holy holy holy (442)"
        
        secondView.document?.page(at: 186)?.accessibilityValue = "how firm a foundation (443)"
        secondView.document?.page(at: 187)?.accessibilityValue = "soldiers of christ arise (444)"
        secondView.document?.page(at: 188)?.accessibilityValue = "awesome god (445)"
        secondView.document?.page(at: 189)?.accessibilityValue = "seek ye first (446)"
        secondView.document?.page(at: 190)?.accessibilityValue = "there’s a fountain free (447)"
        secondView.document?.page(at: 191)?.accessibilityValue = "just a little talk with Jesus (448)"
        secondView.document?.page(at: 193)?.accessibilityValue = "i will sing the wondrous story (449)"
        secondView.document?.page(at: 194)?.accessibilityValue = "hallelujah what a savior (450)"
        secondView.document?.page(at: 195)?.accessibilityValue = "blessed assurance (451)"
        secondView.document?.page(at: 196)?.accessibilityValue = "Christ the lord is risen today (452)"
        secondView.document?.page(at: 197)?.accessibilityValue = "fairest lord Jesus (453)"
        secondView.document?.page(at: 198)?.accessibilityValue = "beneath the cross of Jesus (454)"
        secondView.document?.page(at: 199)?.accessibilityValue = "teach me lord to wait (455)"
        secondView.document?.page(at: 201)?.accessibilityValue = "it is well with my soul (456)"
        
        secondView.document?.page(at: 202)?.accessibilityValue = "when my love to Christ (457)"
        secondView.document?.page(at: 203)?.accessibilityValue = "glory glory halleleujah (458)"
        secondView.document?.page(at: 205)?.accessibilityValue = "we’re marching to zion (459)"
        secondView.document?.page(at: 206)?.accessibilityValue = "i’m not ashamed to own my lord (460)"
        secondView.document?.page(at: 207)?.accessibilityValue = "we praise thee o god (461)"
        secondView.document?.page(at: 208)?.accessibilityValue = "i know that my redeemer lives (462)"
        secondView.document?.page(at: 209)?.accessibilityValue = "my hope is built (463)"
        secondView.document?.page(at: 210)?.accessibilityValue = "joyful joyful we adore thee (464)"
        secondView.document?.page(at: 211)?.accessibilityValue = "be still my soul (465)"
        secondView.document?.page(at: 212)?.accessibilityValue = "i will speak (466)"
        secondView.document?.page(at: 213)?.accessibilityValue = "my god and i (467)"
        secondView.document?.page(at: 214)?.accessibilityValue = "breathe on me breath of god (468)"
        secondView.document?.page(at: 215)?.accessibilityValue = "low in the grave he lay (469)"
        secondView.document?.page(at: 216)?.accessibilityValue = "for the beauty of the earth (470)"
        secondView.document?.page(at: 217)?.accessibilityValue = "just as i am (471)"
        secondView.document?.page(at: 218)?.accessibilityValue = "just a closer walk with thee (472)"
        secondView.document?.page(at: 219)?.accessibilityValue = "arise my sould arise (473)"
        secondView.document?.page(at: 220)?.accessibilityValue = "all to jesus i surrender (474)"
        secondView.document?.page(at: 221)?.accessibilityValue = "christ we do all adore thee (475)"
        secondView.document?.page(at: 222)?.accessibilityValue = "all hail the power (476)"
        secondView.document?.page(at: 223)?.accessibilityValue = "lord speak to me (477)"
        secondView.document?.page(at: 224)?.accessibilityValue = "abide with me (478)"
        secondView.document?.page(at: 225)?.accessibilityValue = "o come all ye faithful (550)"
        
        secondView.document?.page(at: 226)?.accessibilityValue = "o come o come emmanuel (551)"
        secondView.document?.page(at: 227)?.accessibilityValue = "joy to the world (552)"
        secondView.document?.page(at: 228)?.accessibilityValue = "it came upon the midnight clear (553)"
        secondView.document?.page(at: 229)?.accessibilityValue = "angels we have heard on high (554)"
        secondView.document?.page(at: 231)?.accessibilityValue = "what child is this (555)"
        secondView.document?.page(at: 232)?.accessibilityValue = "silent night (556)"
        secondView.document?.page(at: 233)?.accessibilityValue = "hark the herald angels sing (557)"
        secondView.document?.page(at: 236)?.accessibilityValue = "lord i thank you (600)"
        secondView.document?.page(at: 237)?.accessibilityValue = "lord god almighty (601)"
        secondView.document?.page(at: 239)?.accessibilityValue = "run to the fight (602)"
        secondView.document?.page(at: 240)?.accessibilityValue = "siku rin wana (603)"
        secondView.document?.page(at: 241)?.accessibilityValue = "the glory song (604)"
        secondView.document?.page(at: 243)?.accessibilityValue = "in the kingdom (605)"
        secondView.document?.page(at: 245)?.accessibilityValue = "thank you lord (700)"
        secondView.document?.page(at: 246)?.accessibilityValue = "amen (701)"
        secondView.document?.page(at: 247)?.accessibilityValue = "crossing over (702)"
        secondView.document?.page(at: 248)?.accessibilityValue = "e khaya e-khaya (703)"
        secondView.document?.page(at: 249)?.accessibilityValue = "encourage my soul (704)"
        secondView.document?.page(at: 251)?.accessibilityValue = "don’t you wanna go (705)"
        secondView.document?.page(at: 252)?.accessibilityValue = "god is so good (706)"
        secondView.document?.page(at: 253)?.accessibilityValue = "he gave her water (707)"
        secondView.document?.page(at: 257)?.accessibilityValue = "hard fighting soldier (708)"
        secondView.document?.page(at: 258)?.accessibilityValue = "he is lord (709)"
        
        secondView.document?.page(at: 259)?.accessibilityValue = "i am a poor wayfaring stranger (710)"
        secondView.document?.page(at: 260)?.accessibilityValue = "glory glory (711)"
        secondView.document?.page(at: 261)?.accessibilityValue = "i can’t keep it to myself (712)"
        secondView.document?.page(at: 263)?.accessibilityValue = "his eye is on the sparrow (713)"
        secondView.document?.page(at: 264)?.accessibilityValue = "i feel good (714)"
        secondView.document?.page(at: 265)?.accessibilityValue = "i want Jesus to walk with me (715)"
        secondView.document?.page(at: 266)?.accessibilityValue = "i have decided to follow Jesus (716)"
        secondView.document?.page(at: 267)?.accessibilityValue = "i’ll be listening (717)"
        secondView.document?.page(at: 268)?.accessibilityValue = "i’m coming up lord (718)"
        secondView.document?.page(at: 269)?.accessibilityValue = "jesus will fix it (719)"
        secondView.document?.page(at: 271)?.accessibilityValue = "let your living water flow (720)"
        secondView.document?.page(at: 272)?.accessibilityValue = "let us break bread together (721)"
        secondView.document?.page(at: 273)?.accessibilityValue = "i love to praise his holy name (722)"
        secondView.document?.page(at: 275)?.accessibilityValue = "love love love (723)"
        secondView.document?.page(at: 276)?.accessibilityValue = "there is a balm in gilead (724)"
        secondView.document?.page(at: 277)?.accessibilityValue = "i’ve been redeemed (725)"
        secondView.document?.page(at: 278)?.accessibilityValue = "oh how i love Jesus (726)"
        secondView.document?.page(at: 279)?.accessibilityValue = "sing amen amen (727)"
        secondView.document?.page(at: 280)?.accessibilityValue = "sign me up (728)"
        secondView.document?.page(at: 281)?.accessibilityValue = "jordan river (729)"
        secondView.document?.page(at: 282)?.accessibilityValue = "someday (730)"
        secondView.document?.page(at: 283)?.accessibilityValue = "soon and very soon (731)"
        secondView.document?.page(at: 284)?.accessibilityValue = "swing low sweet chariot (732)"
        
        secondView.document?.page(at: 285)?.accessibilityValue = "take the lord with you (733)"
        secondView.document?.page(at: 287)?.accessibilityValue = "wade in the water (734)"
        secondView.document?.page(at: 289)?.accessibilityValue = "where you there (735)"
        secondView.document?.page(at: 290)?.accessibilityValue = "we shall overcome (736)"
        secondView.document?.page(at: 291)?.accessibilityValue = "i tried and i tried (737) ; would you be poured out like wine (738)"
        secondView.document?.page(at: 292)?.accessibilityValue = "walking on the heaven road (739)"
        secondView.document?.page(at: 295)?.accessibilityValue = "amazing grace (800)"
        secondView.document?.page(at: 297)?.accessibilityValue = "as many as possible (801)"
        secondView.document?.page(at: 299)?.accessibilityValue = "glory glory hallelujah (802)"
        secondView.document?.page(at: 301)?.accessibilityValue = "god alone (803)"
        secondView.document?.page(at: 303)?.accessibilityValue = "create in me a pure heart (804)"
        secondView.document?.page(at: 305)?.accessibilityValue = "Jesus is lord (805)"
        secondView.document?.page(at: 306)?.accessibilityValue = "hallelujah chorus (880)"
        secondView.document?.page(at: 313)?.accessibilityValue = "all hail the power (881)"
        secondView.document?.page(at: 316)?.accessibilityValue = "ain’t no rock (900)"
        secondView.document?.page(at: 317)?.accessibilityValue = "we are soldiers in the army (901)"
        secondView.document?.page(at: 318)?.accessibilityValue = "halalalalelujah (902) ; deep down in my heart (903)"
        secondView.document?.page(at: 319)?.accessibilityValue = "give me oil in my lamp (904)"
        secondView.document?.page(at: 320)?.accessibilityValue = "his banner over me is love (905)"
        
        secondView.document?.page(at: 321)?.accessibilityValue = "i tried and i tried (906); i’m happy today (907)"
        secondView.document?.page(at: 322)?.accessibilityValue = "this little light of mine (908); i’m gonna view that holy city (909)"
        secondView.document?.page(at: 323)?.accessibilityValue = "jesus loves the little children (910); in my father’s house (911)"
        secondView.document?.page(at: 324)?.accessibilityValue = "i’ve got the joy joy joy (912); love love love (913)"
        secondView.document?.page(at: 325)?.accessibilityValue = "the christian jubilee (914); oh be careful (915)"
        secondView.document?.page(at: 326)?.accessibilityValue = "my god is so great (916); roll the gospel chariot (917)"
        secondView.document?.page(at: 327)?.accessibilityValue = "rejoice in the lord always (918) ; praise him praise him (919)"
        secondView.document?.page(at: 328)?.accessibilityValue = "peace like a river (920) ; whose side are you fighting on (921)"
        secondView.document?.page(at: 329)?.accessibilityValue = "rise and shine (922)"
        secondView.document?.page(at: 330)?.accessibilityValue = "standing in the need of prayer (923)"
        secondView.document?.page(at: 331)?.accessibilityValue = "the new testament song (924)"
        secondView.document?.page(at: 332)?.accessibilityValue = "show me the way (925); the sea of galilee (926)"
        secondView.document?.page(at: 333)?.accessibilityValue = "this is the day (927) ; this is my commandment (928)"
        secondView.document?.page(at: 334)?.accessibilityValue = "the wise man (929)"
        secondView.document?.page(at: 335)?.accessibilityValue = "king of the jungle (930)"
        secondView.document?.page(at: 336)?.accessibilityValue = "i’m in the lord’s army (931) ; building up the kingdom (932)"
        secondView.document?.page(at: 337)?.accessibilityValue = "jesus is well and alive today (933)"
        
        secondView.zoomOut(self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPages()
        
        if (favTitle != nil)
        {
            favTitle = favTitle?.lowercased()
            
            var pages = 0
            var myPage = secondView.document?.page(at: 0)
            
            
            
            while ((myPage!.accessibilityValue != favTitle) && (pages != 339)) {
                
                secondView.goToNextPage(self)
                myPage = secondView.currentPage
                pages += 1
            }
            
        }
        else
        {
            secondView.go(to: secondView.document!.page(at: 18)!)
            
        }
        UIGraphicsEndImageContext()
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // UIgraphicsEndImageContext()
        
    }
    
    
    
    @IBAction func searchAction(_ sender: Any) {
        navBar.alpha = 0
        searchBar.alpha = 1
        searchBar.becomeFirstResponder()
        
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
            let index = favorites.firstIndex(of: (current?.accessibilityValue)!)
            favorites.remove(at: index!)
            checked.remove(at: index!)
            Toast(context: self, msg: "Removed from favorites")
        }
        
        let defaults = UserDefaults.standard // 1
        
        defaults.set(favorites, forKey: "favorites")
        defaults.set(checked, forKey: "checked")
        defaults.synchronize()
        
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
        
    }
    
    @IBAction func tapActionRecog(_ sender: Any) {
        searchBar.endEditing(true)
        searchBar.alpha = 0
        navBar.alpha = 1
        
        secondView.clearSelection()
        //  player?.stop()
        
    }
    
    @IBAction func pitchPipeAction(_ sender: Any) {
    }
    
    @IBAction func partsButtonPressed(_ sender: Any) {
        //get current song name, either have popup or new VC.
        //Fetch corresponding song 
        
    }
    
}


extension secondViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var pages = 0
        let songTitle = searchBar.text!
        
        let currentPage = secondView.currentPage
        var myPage = secondView.document?.page(at: 0)
        
        activityIndic.center = self.view.center
        activityIndic.hidesWhenStopped = true
        
        self.view.addSubview(activityIndic)
        activityIndic.startAnimating()
        self.searchSongTableView.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05 ){
            //sleep(2)
            self.secondView.goToFirstPage(self)
            var condition = false
            var numericInd = false
            if (Int(songTitle) != nil)
            {
                numericInd = true
                condition = ((myPage!.accessibilityValue?.contains(songTitle)) != true) && (pages != 339)
            }
            else{
                condition = ((myPage!.accessibilityValue?.hasPrefix(songTitle.lowercased())) != true) && (pages != 339)
            }
            while (condition)
            {
                if ((myPage!.accessibilityValue?.contains(";") != false) && (myPage!.accessibilityValue?.contains(songTitle.lowercased())) == true){
                    condition = false
                    break
                }
                
                self.secondView.goToNextPage(self)
                myPage = self.secondView.currentPage
                pages += 1
                
                if (numericInd){
                    condition = ((myPage!.accessibilityValue?.contains(songTitle)) != true) && (pages != 339)
                }
                else {
                    condition = ((myPage!.accessibilityValue?.hasPrefix(songTitle.lowercased())) != true) && (pages != 339)
                }
                
            }
            
            
            if (pages == 339)
            {
                self.secondView.go(to: currentPage!)
                
                
            }
            searchBar.alpha = 0
            self.navBar.alpha = 1
            self.activityIndic.stopAnimating()
            
        }
        UIGraphicsEndImageContext()
        
        self.searchBar.alpha = 0
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            
            searchSongTableView.reloadData()
            searchBar.becomeFirstResponder()
        }
        else{
            isSearching = true
            if (Int(searchBar.text ?? "") != nil)
            {
                filteredSongs = allSongs.filter{item in return item.lowercased().contains (searchBar.text?.lowercased() ?? "")}
            }
            else{
                filteredSongs = allSongs.filter{item in return item.lowercased() .hasPrefix(searchBar.text?.lowercased() ?? "")}
            }
            
            searchSongTableView.reloadData()
        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchSongTableView.alpha = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            tableView.alpha = 1
            return filteredSongs.count
        }
        else {
            tableView.alpha = 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var text: String
        let cell = tableView.dequeueReusableCell(withIdentifier: "filteredSongs", for: indexPath) as! FilteredSongsTableViewCell
        if isSearching{
            text = filteredSongs[indexPath.row]
            cell.songTitle.text = text.capitalized
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FilteredSongsTableViewCell else {return}
        let title = cell.songTitle.text
        let searchBar: UISearchBar = UISearchBar()
        searchBar.text = title
        searchBarSearchButtonClicked(searchBar)
        tableView.alpha = 0
    }
    
    
    
}


//
//  PlayerDetailVC.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 22/03/2023.
//

import UIKit
import Foundation
import SDWebImage

class PlayerDetailVC: UIViewController {
    var player : PData?
    var playersdetail : PlayerDetail?
    var sectionHeaderTitles = [String]()
    var infoTitle = [String]()
    
    
    @IBOutlet weak var playerDetailTV: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var market: UILabel!
    @IBOutlet weak var pnumber: UILabel!
    @IBOutlet weak var ratings: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var infoStack: UIStackView!
    @IBOutlet weak var infoCv: UICollectionView!
    @IBOutlet weak var heightConstrain: NSLayoutConstraint!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.infoCv.delegate = self
        self.infoCv.dataSource = self
        self.playerDetailTV.delegate = self
        self.playerDetailTV.dataSource = self
        self.playerDetailTV.estimatedRowHeight = 70
        playerDetailTV.rowHeight = UITableView.automaticDimension
       playerDetailTV.translatesAutoresizingMaskIntoConstraints = true
        callPlayerDetail()
    }
   
    
    func callPlayerDetail(){
        self.addLoader()
        if let slugname = player?.slug ?? "" as? String , slugname != ""{
            NetworkManager.shared.dataTask(serviceURL: Enpoint.player_detail.rawValue, httpMethod: .post, parameters: ["slug":slugname]) { (response, error) in
                do{
                    if response != nil {
                        print(response)
                        self.sectionHeaderTitles.removeAll()
                        let jsonDecoder = JSONDecoder()
                        var playerDatas = try jsonDecoder.decode(PlayerDetail.self, from: (response as? Data)!)
                        do {
                            let json = try JSONSerialization.jsonObject(with: response as! Data, options: [])
                        } catch {
                            print("errorMsg")
                        }
                        DispatchQueue.main.async {
                            self.playersdetail = playerDatas
                            self.updateView()
                            self.dismissLoadr()
                            
                            if error != nil {
                                print("Error Occoured")
                            }
                        }
                    }
                }catch{
                    
                }
                
            }
        }
    }
   func updateView(){
       if let url = URL(string: self.playersdetail?.playerDat?.player_photo ?? ""){
           self.imagePlayer?.sd_setImage(with: url)
       }
       self.name?.text = self.playersdetail?.playerDat?.player_name
       self.team?.text = self.playersdetail?.playerDat?.player_country
       self.teamCountry?.text = self.playersdetail?.playerDat?.team_name
       if let url = URL(string: self.playersdetail?.playerDat?.team_photo ?? ""){
           self.icon?.sd_setImage(with: url)
       }
       if let indi = self.playersdetail?.playerDat?.indicators {
           self.sectionHeaderTitles.append("About Player")
           self.infoTitle.append( "Info")
           for item in indi {
               if item.key == "Main position" {
                   self.position.text = item.value
               }
               
               if item.key ==   "Player number"{
                   self.pnumber.text = item.value
               }
               if item.key ==   "Market price"{
                   self.market.text = item.value
               }
               if item.key ==   "Age"{
                   self.age.text = item.value
               }
               if item.key ==  "Rating"{
                   self.ratings.text = item.value
               }
           }
       }
       if (self.playersdetail?.playerDat?.rating) != nil{
           self.sectionHeaderTitles.append("Ratings")
       }
       if (self.playersdetail?.playerDat?.medias) != nil{
           self.infoTitle.append("Media")
       }
       if (self.playersdetail?.playerDat?.events) != nil{
           self.infoTitle.append("Events")
       }
       if (self.playersdetail?.playerDat?.statistics) != nil{
           self.infoTitle.append("Statistics")
       }
       self.playerDetailTV.reloadData()
       self.playerDetailTV.setNeedsLayout()
       self.playerDetailTV.layoutIfNeeded()
       self.playerDetailTV.reloadData()
       self.infoCv.reloadData()
        
    }
    
}


extension PlayerDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.playersdetail?.playerDat?.indicators?.count ?? 0
        default:
            return self.playersdetail?.playerDat?.rating?.count ?? 0
        }
        return  0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0,indexPath.section == 0{
            return 300.0
        }
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionHeaderTitles.count
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderBackgroundColor = UIColor.clear
        let sectionHeaderLabelView = UIView()
        sectionHeaderLabelView.backgroundColor = sectionHeaderBackgroundColor
        
        let sectionHeaderLabel = UILabel()
        sectionHeaderLabel.text = sectionHeaderTitles[section]
        sectionHeaderLabel.textAlignment = .center
        sectionHeaderLabel.textColor = hexStringToUIColor(hex: "#DE253A")
        sectionHeaderLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        sectionHeaderLabel.frame = CGRect(x: 43, y: 5, width: 250, height: 40)
        sectionHeaderLabelView.addSubview(sectionHeaderLabel)

        return sectionHeaderLabelView
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = playerDetailTV.dequeueReusableCell(withIdentifier: "PlayerDetailTVCell", for: indexPath) as? PlayerDetailTVCell{
                cell.about.isHidden = false
                cell.detail.text = self.playersdetail?.playerDat?.indicators?[indexPath.row].key
                cell.descriptionL.text = self.playersdetail?.playerDat?.indicators?[indexPath.row].value
                switch indexPath.row{
                case 0:
                    cell.about.isHidden = false
                    let textabt = self.playersdetail?.playerDat?.about?.description
                    cell.about.text = self.playersdetail?.playerDat?.about
                    
                default:
                    cell.about.isHidden = true
                    cell.heightConstarin.constant = 0
                    
                }
                
                
                return cell
            }
        default:
            if let cell = playerDetailTV.dequeueReusableCell(withIdentifier: "PlayerDetailTVCell", for: indexPath) as? PlayerDetailTVCell{
                cell.heightConstarin.constant = 0
                cell.about.isHidden = true
                cell.detail.text = self.playersdetail?.playerDat?.rating?[indexPath.row].key
                cell.descriptionL.text = self.playersdetail?.playerDat?.rating?[indexPath.row].value
               
                
                
                return cell
            }
        }
        return UITableViewCell()
        
    }
    
}



extension PlayerDetailVC :UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = infoCv.dequeueReusableCell(withReuseIdentifier: "InfoCVCell", for: indexPath) as? InfoCVCell{
            
            cell.infoicon.layer.cornerRadius = 5.0
            cell.contentView.addShadow()
            cell.infoLabel.text = infoTitle[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
   
}


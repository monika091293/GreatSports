//
//  PlayersViewController.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 21/03/2023.
//
import Foundation
import UIKit
import SDWebImage



class PlayersViewController: UIViewController {
    var players : Players?

    @IBOutlet weak var playerTV: UITableView!
    @IBOutlet weak var collectionViewPlayer: UICollectionView!
    @IBOutlet weak var collectionPlayers: UICollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        let navBar = self.navigationController!.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = hexStringToUIColor(hex: "#DF4F53")

        let compactAppearance = standardAppearance.copy()
        standardAppearance.backgroundColor = hexStringToUIColor(hex: "#DF4F53")

        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance
        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navBar.compactScrollEdgeAppearance = compactAppearance
        }
        
        collectionViewPlayer.delegate = self
        collectionViewPlayer.dataSource = self
        playerTV.delegate = self
        playerTV.dataSource = self
        playerTV.estimatedRowHeight = 70
        playerTV.rowHeight = UITableView.automaticDimension
        callPlayerApi()
       
    }
    
    
    func callPlayerApi(){
     addLoader()
     NetworkManager.shared.dataTask(serviceURL: Enpoint.player.rawValue, httpMethod: .get, parameters: nil) { (response, error) in
         do{
             if response != nil {
                 print(response)
                 let jsonDecoder = JSONDecoder()
                 let playerData = try jsonDecoder.decode(Players.self, from: (response as? Data)!)
                 DispatchQueue.main.async {
                     self.players = playerData
                     self.collectionViewPlayer.reloadData()
                     self.collectionViewPlayer.setNeedsLayout()
                     self.collectionViewPlayer.layoutIfNeeded()
                     self.collectionViewPlayer.reloadData()
                     self.playerTV.reloadData()
                     self.playerTV.setNeedsLayout()
                     self.playerTV.layoutIfNeeded()
                     self.playerTV.reloadData()
                     self.dismissLoadr()
                 }
                
                 
                 if let jsonResult = playerData.pdata
                 {
                     print(jsonResult)
                 }
             }
             if error != nil {
                 print("Error Occoured")
             }
         }catch{
             
         }
        }
    }
    

}

//MARK: - CollectionView
extension PlayersViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players?.pdata?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if let cell = collectionViewPlayer.dequeueReusableCell(withReuseIdentifier: "PlayerCVCell", for: indexPath) as? PlayerCVCell{

            if let url = URL(string: players?.pdata?[indexPath.row].photo ?? ""){
                cell.playerImg.sd_setImage(with: url)
                cell.playerImg.layer.cornerRadius = 5.0
                
                cell.contentView.addShadow()
                cell.containerView.addShadow()
                cell.playername.text = players?.pdata?[indexPath.row].name
                cell.playerteam.text = players?.pdata?[indexPath.row].team_country
                
            }
        
        return cell
    }
    
   return UICollectionViewCell()
}
    
    
   
}
//MARK: - Tableview

extension PlayersViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players?.pdata?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = playerTV.dequeueReusableCell(withIdentifier: "PlayerTVCell", for: indexPath) as? PlayerTVCell{

            if let url = URL(string: players?.pdata?[indexPath.row].photo ?? ""){
                cell.playerTVimg.sd_setImage(with: url)
                cell.playerTVimg.layer.cornerRadius = 5.0
                cell.contentView.addShadow()
                cell.containerview.addShadow()
                cell.playerName.text = players?.pdata?[indexPath.row].name
                cell.playerDescription.text = (players?.pdata?[indexPath.row].team_flag?.uppercased() ?? "") + " | " + (players?.pdata?[indexPath.row].position_name ?? "")
                cell.rating.text = players?.pdata?[indexPath.row].rating
                
            }
        
        return cell
    }
    return UITableViewCell()
    
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "PlayerDetailVC", sender: self)
        navigatetoDetail(indexpath: indexPath)

    }


    
    func navigatetoDetail(indexpath:IndexPath){
        let selectedRow = playerTV.indexPathForSelectedRow!.row
        let currentCell = playerTV.cellForRow(at: indexpath) as? PlayerTVCell
        let currentCellText = players?.pdata?[selectedRow]
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerDetailVC") as? PlayerDetailVC
        detailsVC?.player = currentCellText
        self.navigationController?.pushViewController(detailsVC ?? PlayerDetailVC(), animated: true)
    }
}

//
//  RoomsVC.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

class RoomsVC: UIViewController {
    
    @IBOutlet weak var roomTV: UITableView!

    lazy var viewModel = RoomViewModel()
    var roomsList: [RoomsDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
       
    }
    
    func onViewDidLoad() {
        viewModel.getRooms(with: EndPoints.getRooms) {[weak self] (data, error) in
            if let room = data {
                self?.updateUI(room)
            }
        }
    }
    
    func updateUI(_ room: [RoomsDataModel]) {
        roomsList = room
        DispatchQueue.main.async { [weak self] in
            self?.roomTV.reloadData()
        }
        
    }
}

//MARK:- TableView DataSource and Delegates
extension RoomsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomTVCell.identifier) as! RoomTVCell
        cell.didSetData(room: roomsList[indexPath.row])
        return cell
        
    }

}

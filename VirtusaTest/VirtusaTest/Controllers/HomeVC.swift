//
//  HomeVC.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var headings: [ScreenType] = [.people, .room]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.reloadData()
        
    }
}

//MARK:- TableView DataSource and Delegates
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = headings[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch headings[indexPath.row] {
        case .people:
            guard let vc = Storyboards.Main.instantiateVC(PeopleVC.self) else { return }
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            guard let vc = Storyboards.Main.instantiateVC(RoomsVC.self) else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//
//  ViewController.swift
//  favoritePlaces_JAYESH_C0880752
//
//  Created by Jayesh Khistria on 2023-01-24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var addBtnOutlet: UIBarButtonItem!
    var favoritePlace: [String] = ["Dubai", "Montreal", "New York", "Tokyo", "Berlin", "Moscow", "Egypt"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritePlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = "\(favoritePlace[indexPath.row])"
                cell.addSubview(label)
                return cell
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {
                favoritePlace.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)

            } else if editingStyle == .insert {
              
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue", sender: cell)
        
    

        
    }
    
    
    
    
}


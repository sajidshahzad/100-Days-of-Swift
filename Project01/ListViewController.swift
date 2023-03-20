//
//  ListViewController.swift
//  Project01
//
//  Created by Sajid Shahzad on 24/02/2023.
//

import UIKit

class ListViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet var tableView: UITableView!
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // tableView.delegate = self
        //tableView.dataSource = self
        tableView.register(UINib(nibName: "PhotoNameTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoNameTableViewCell")
        
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
       
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoNameTableViewCell", for: indexPath) as! PhotoNameTableViewCell
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

//
//  MainViewController.swift
//  BrawlDatabase
//
//  Created by IGNACIO OLAGORTA VERA on 19/12/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    internal var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        title="Mis Tareas"

        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addBarButtonItem, animated: false)
        // Do any additional setup after loading the view.
    }

    @objc internal func addPressed(){
        let addVC = AddViewController()
        addVC.delegate = self
        addVC.modalTransitionStyle = .coverVertical
        addVC.modalPresentationStyle = .overCurrentContext
        present(addVC, animated: true, completion: nil)
    }
    
    internal func registerCells(){
        let nib = UINib(nibName: "TaskCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskCell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.textLabel?.text = "Ejemplo de task"
        cell.imgTaskCell.image = #imageLiteral(resourceName: "check")
        cell.imgTaskCell.isHidden = false
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}
extension MainViewController: AddViewControllerDelegate{
    func addViewController(_ vc: AddViewController, didEditTask task: Task) {
        vc.dismiss(animated: true, completion: nil)
    }
}

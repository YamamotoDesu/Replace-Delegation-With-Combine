//
//  ViewController.swift
//  CombineSample
//
//  Created by 山本響 on 2021/09/19.
//

import UIKit

class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addItemViewController = storyBoard.instantiateViewController(withIdentifier: "addItemViewController") as! AddItemViewController
        addItemViewController.delegate = self
        
        self.present(addItemViewController, animated: true, completion: nil)
    }

    var items: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
}

extension ItemsViewController: AddItemViewControllerDelegate {
    func didAddItem(_ item: String) {
        self.items.append(item)
        self.tableView.beginUpdates()
        self.tableView.insertRows(
            at: [
                .init(row: items.count - 1,
                      section: 0)
            ],
            with: .automatic
        )
        self.tableView.endUpdates()
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}



import UIKit

class DepartmentController: UITableViewController {
    let departmentArray = ["임원","영업부","인사부","경리부"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departmentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = departmentArray[indexPath.row]
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? EmployeeController else {
            return
        }
        let index = tableView.indexPathForSelectedRow?.row
        destController.departmentName = departmentArray[index!]
    }
}

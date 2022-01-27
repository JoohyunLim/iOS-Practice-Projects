
import UIKit
import Kanna
import Alamofire

class MovieController: UITableViewController {
    var MovieItem: [String] = []
    var MovieURL: [String] = []

    @IBAction func refreshButton(_ sender: Any) {
        MovieItem = []
        self.getMovie()
        
    }
    
    
    func getMovie() -> Void {
        let urlString = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"
        AF.request(urlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let htmlStr):
                self.parseHTML(str: htmlStr)
            case .failure(let error):
                print(error)
            }
        }
    }

    func parseHTML(str: String) -> Void {
        let document = try? Kanna.HTML(html: str, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for item in doc.xpath("//div[@class='tit3']/a") {
            if let text = item.text {
                MovieItem.append(text)
            }
        }
        for url in doc.xpath("//div[@class='tit3']/a/@href") {
            if let text = url.text {
                MovieURL.append(text)
            }
        }

        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovie()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieItem.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = MovieItem[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? DetailController else {
            return
        }
        let index = tableView.indexPathForSelectedRow?.row
        destController.mUrl = MovieURL[index!]
    }}

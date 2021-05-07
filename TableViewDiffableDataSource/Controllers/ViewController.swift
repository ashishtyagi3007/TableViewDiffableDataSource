//
//  ViewController.swift
//  TableViewDiffableDataSource
//
//  Created by Ashish Tyagi on 05/05/21.
//

import UIKit


class ViewController: UIViewController {

    // MARK:- outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- variables

    var charactersData: [Character] = [
        
        Character(id: 30,
                  comicCharacters: [
                    CharactersData(id: 1, name: "Iron Man", image: "marvels01"),
                    CharactersData(id: 2, name: "Captain America", image: "marvels02"),
                    CharactersData(id: 3, name: "Spider Man", image: "marvels03"),
                    CharactersData(id: 4, name: "Thanos", image: "marvels04"),
                    CharactersData(id: 5, name: "Thor", image: "marvels05"),
                    CharactersData(id: 6, name: "Ant-Man and The Wasp", image: "marvels06"),
                    CharactersData(id: 7, name: "Avengers", image: "marvels07"),
                    CharactersData(id: 8, name: "Deadpool", image: "marvels08"),
                    CharactersData(id: 9, name: "Wolverine", image: "marvels09"),
                    CharactersData(id: 10, name: "Black Panther", image: "marvels10")
                  ], type: .marvel),
        
        Character(id: 99,
                  comicCharacters: [
                    CharactersData(id: 11, name: "Superman", image: "dc01"),
                    CharactersData(id: 22, name: "Batman", image: "dc02"),
                    CharactersData(id: 3, name: "Wonder Woman", image: "dc03"),
                    CharactersData(id: 44, name: "Aquaman", image: "dc04"),
                    CharactersData(id: 55, name: "Flash", image: "dc05"),
                  ], type: .dc)
        
        ]
    
    // diffable data source
    private var dataSource: UITableViewDiffableDataSource<SectionData,CharactersData>?
    
    // MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: MarvelsCharacterTableViewCell.description(), bundle: nil), forCellReuseIdentifier: MarvelsCharacterTableViewCell.description())
        
        self.tableView.delegate = self
        
        dataSource = UITableViewDiffableDataSource<SectionData, CharactersData>(tableView: tableView) { (tableView, indexPath, charactersData) -> MarvelsCharacterTableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MarvelsCharacterTableViewCell.description(),for: indexPath) as! MarvelsCharacterTableViewCell
            
            cell.setupCell(charactersData: charactersData)
            return cell
        }
        dataSource?.defaultRowAnimation = .fade
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.applySnapshot(animated: false)
    }
    
    // MARK:- outlets & objc functions
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        
        for i in 0 ..< self.charactersData.count {
            self.charactersData[i].comicCharacters = charactersData[i].comicCharacters.shuffled()
        }
        
      // self.charactersData =  self.charactersData.shuffled()
        
        self.applySnapshot(animated: true)
    }
    
    // MARK:- functions
    private func applySnapshot(animated: Bool = true){
        var snapshot = NSDiffableDataSourceSnapshot<SectionData, CharactersData>()
        snapshot.appendSections(SectionData.allCases)
        for data in charactersData {
                snapshot.appendItems(data.comicCharacters, toSection:  SectionData.marvel)
                snapshot.appendItems(data.comicCharacters, toSection:  SectionData.dc)
        }
        dataSource?.apply(snapshot, animatingDifferences: animated)
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 68))
        headerView.backgroundColor = UIColor.systemBackground

        let sectionLabel = UILabel()

        //if charactersData[section].type.rawValue ==
        sectionLabel.text = charactersData[section].type.rawValue
        sectionLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        sectionLabel.frame = CGRect(x: 24, y: 34 - sectionLabel.intrinsicContentSize.height / 2, width: sectionLabel.intrinsicContentSize.width + 12, height: sectionLabel.intrinsicContentSize.height)

        headerView.addSubview(sectionLabel)
        return headerView
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 68
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        // Get selected hero using index path
//        guard let selectedHero = dataSource?.itemIdentifier(for: indexPath) else {
//              tableView.deselectRow(at: indexPath, animated: true)
//              return
//          }
//
//          // Create a new copy of selectedHero & update it
//          var updatedHero = selectedHero
//        updatedHero.power = updatedHero.power?.appending(" ★")
//
//          // Create a new copy of data source snapshot for modification
//        var newSnapshot = dataSource?.snapshot()
//        // Replacing selectedHero with updatedHero
//        newSnapshot?.insertItems([updatedHero], beforeItem: selectedHero)
//         newSnapshot?.deleteItems([selectedHero])
//          // Apply snapshot changes to data source
//        dataSource?.apply(newSnapshot!)
    }
}


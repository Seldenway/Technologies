import UIKit

protocol TableViewSectionType {
    var section: TableViewSection { get }
    var id: Int { get }
}

extension TableViewSectionType {
    var section: TableViewSection { .default }
    var id: Int { Int() }
}

final class TableViewSection: Hashable {
    private let sectionId: Int
    let headerView: UIView?
    let footerView: UIView?
    
    init() {
        headerView = nil
        footerView = nil
        sectionId = Int()
    }
    
    init(
        sectionId: Int = Int(),
        headerView: UIView? = nil,
        footerView: UIView? = nil
    ) {
        self.sectionId = sectionId
        self.headerView = headerView
        self.footerView = footerView
    }
    
    static func == (lhs: TableViewSection, rhs: TableViewSection) -> Bool {
        lhs.sectionId == rhs.sectionId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(sectionId)
    }
}

extension TableViewSection {
    enum TableViewSectionView {
        case header(UIView)
        case footer(UIView)
    }
}

extension TableViewSection {
    static let `default` = TableViewSection()
    static func header(section id: Int = Int(), view: UIView) -> TableViewSection {
        TableViewSection(sectionId: id, headerView: view)
    }
    
    static func footer(section id: Int = Int(), view: UIView) -> TableViewSection {
        TableViewSection(sectionId: id, footerView: view)
    }
}

//
//  JSTableViewHeader.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import SnapKit

class JSTableViewHeader: UIView {

    static let headerHeight: CGFloat = 146.0
    
    private var padding: CGFloat {
        return 14.0
    }
    
    lazy var heading1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26.0, weight: .regular)
        label.text = NSLocalizedString("Work with pleasure.", comment: "Job search first heading.")
        label.textColor = UIColor(red: 32.0/255, green: 32.0/255, blue: 32.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var heading2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        label.text = NSLocalizedString("Always", comment: "Job search second heading.")
        label.textColor = UIColor(red: 48.0/255, green: 48.0/255, blue: 48.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var heading3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 85.0/255, green: 85.0/255, blue: 85.0/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .regular)
        label.text = NSLocalizedString("Shifts in your area", comment: "Job search third heading.")
        return label
    }()
    
    lazy var heading4: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 131.0/255, green: 131.0/255, blue: 131.0/255, alpha: 1.0)
        let header4Txt = NSLocalizedString("Shifts avaialble all across the country attributed heading", comment: "Job search details attributed heading.")
        if let data = header4Txt.data(using: .utf8) {
            // push the attributed text creating to next runloop to avoid UI update delay
            // TODO:-
            // needs further optimization with profiling
            DispatchQueue.main.async {
                let attributedText = try? NSAttributedString(data: data,
                                                                options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html,
                                                                          NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
                                                                documentAttributes: nil)
                label.attributedText = attributedText
            }
            return label
        }
        // In situations where NSAttributedString failed to parse the given html string
        // Use the simple label text in order to avoid app crashing
        label.text = NSLocalizedString("Shifts avaialble all across the country simple headin", comment: "Job search details simple heading.")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        configureLayout()
    }
    
    static func install() -> UIView {
        return JSTableViewHeader(frame: CGRect(x: 0, y: 0, width: 0, height: headerHeight))
    }
    
    func initialize(){
        self.addSubview(heading1)
        self.addSubview(heading2)
        self.addSubview(heading3)
        self.addSubview(heading4)
    }
    
    func configureLayout(){
        heading1.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(padding)
            make.top.equalToSuperview().inset(padding)
            make.trailing.equalToSuperview().inset(padding)
        }
        
        heading2.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(padding)
            make.top.equalTo(heading1.snp.bottom)
            make.trailing.equalToSuperview().inset(padding)
        }
        
        heading4.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(padding)
            make.bottom.equalToSuperview().inset(padding)
            make.trailing.equalToSuperview().inset(padding)
        }
        
        heading3.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(padding)
            make.bottom.equalTo(heading4.snp.top).offset(-4.0)
            make.trailing.equalToSuperview().inset(padding)
        }
    }
}

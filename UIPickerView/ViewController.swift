//
//  ViewController.swift
//  UIPickerView
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 1.09.2022.
//

import UIKit
import SwiftUI

//struct Appoinment {
//    let appointmentBeginTime : String
//    let appointmentEndTime: String
//}

class ViewController: UIViewController {
    
    let toolbar:UIToolbar = {
        let tool = UIToolbar()
        tool.sizeToFit()
        return tool
    }()
    
    lazy var textField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Lütfen Saat Aralığı Seçin"
        txt.inputAccessoryView = toolbar
        txt.delegate = self
        txt.tag = 1
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupToolBar()
        textField.inputAccessoryView = toolbar
        textField.inputView = deneme()
        view.addSubview(textField)
        
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
    }
    
    func setupToolBar() {
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(doneTapped))
        toolbar.setItems([spaceButton,doneButton], animated: true)
    }
    @objc func doneTapped() {
        textField.resignFirstResponder()
        
    }
    
    func deneme() -> PickerColumnRow {
        let calendar = Calendar(identifier: .gregorian)

        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar

        components.year = -18
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -150
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        

        print(maxDate)
        var nptSelected = PickerRowModel(title: "12:30")
        nptSelected.rowSelectable = false
        let pickerRow: [PickerRowType] = [
            PickerRowModel(title: "Deneme1")
            ,PickerRowModel(title: "Deneme2")
            ,nptSelected]
        var nptSelected4 = PickerRowModel(title: "12:30")
        nptSelected4.rowSelectable = false
        nptSelected.rowSelectable = false
        let pickerRow2: [PickerRowType] = [
            PickerRowModel(title: "Deneme1"),
            nptSelected4,
            PickerRowModel(title: "12:30")]
        let pickerColumnDenemesi: PickerColumn = PickerColumnModel(rows: pickerRow)
        let column2: PickerColumn = PickerColumnModel(rows: pickerRow2)
        let pckrDataSource = PickerColumnRowDataSource.Builder()
            .setColumnList(columnList: [pickerColumnDenemesi,column2])
            .rowSelectedHandler({[textField] selectedRow in
                textField.placeholder = selectedRow?.title
            })
            .build()
        
        let columnRow: PickerColumnRow = PickerColumnRow(customDataSource: pckrDataSource)
        return columnRow
    }
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
struct PickerRowModel: PickerRowType {
    var rowSelectable: Bool = true
    
    var attributedTittle: NSAttributedString?
    var title: String?
}
struct PickerColumnModel: PickerColumn {
    var rows: [PickerRowType]
}


protocol PickerRowType {
    var title: String? { get set}
    var attributedTittle: NSAttributedString? { get set}
    var rowSelectable: Bool { get set }
}
protocol PickerColumn {
    var rows: [PickerRowType] { get set}
}

//PickerColumnRowDataSource
protocol PickerColumnRowDataSourceProtocol {
    var columnList: [PickerColumn] { get }
    var selectedRowHandler: ((_ selectedRow: PickerRowType?) -> Void)? { get }
    func colum(index: Int) -> PickerColumn
    func columCount() -> Int
    func getColumnRow(indexPath: IndexPath) -> PickerRowType
}
extension PickerColumnRowDataSourceProtocol {
    
    func getColumnRow(indexPath: IndexPath) -> PickerRowType {
        return columnList[indexPath.section].rows[indexPath.row]
    }
    func columCount() -> Int {
        return columnList.count
    }
    func colum(index: Int) -> PickerColumn {
        return columnList[index]
    }
}

class PickerColumnRowDataSource: PickerColumnRowDataSourceProtocol {
    private(set) var selectedRowHandler: ((PickerRowType?) -> Void)?
    private(set) var columnList: [PickerColumn] = []
    var lastSelectedRow: PickerRowType?
    var lastSelectedStoredRow: PickerRowType?
    class Builder {
        var pickerDataSource = PickerColumnRowDataSource()
        func setColumnList(columnList: [PickerColumn]) -> Self {
            pickerDataSource.columnList = columnList
            return self
        }
        
        func rowSelectedHandler(_ rowHandle: @escaping ((_ selectedRow: PickerRowType?) -> Void)) -> Builder  {
            pickerDataSource.selectedRowHandler = rowHandle
            return self
        }
        
        func build() -> PickerColumnRowDataSource{
            return pickerDataSource
        }
        
    }
}



class PickerColumnRow: UIPickerView {
    var customDataSource:PickerColumnRowDataSource?
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(customDataSource:PickerColumnRowDataSource?) {
        self.init(frame: .zero)
        self.customDataSource = customDataSource
    }
    
}
extension PickerColumnRow :UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return customDataSource?.columCount() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return customDataSource?.colum(index: component).rows.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let indexPath = IndexPath(row: row, section: component)
        pickerView.tintColor = .red
        return customDataSource?.getColumnRow(indexPath: indexPath).title
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let indexPath = IndexPath(row: row, section: component)
        guard let selectedRow = customDataSource?.getColumnRow(indexPath: indexPath) else { return }
        customDataSource?.lastSelectedStoredRow = selectedRow
        if selectedRow.rowSelectable{
            customDataSource?.selectedRowHandler?(selectedRow)
        } else {
            let row = customDataSource?.columnList[indexPath.section].rows.lastIndex(where: {$0.rowSelectable})
            pickerView.selectRow(row ?? 0, inComponent: indexPath.section, animated: true)
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let indexPath = IndexPath(row: row, section: component)
        
        guard let row = customDataSource?.getColumnRow(indexPath: indexPath) else { return nil}
        
        if let attr = row.attributedTittle {
            return attr
        } else {
            if (row.rowSelectable) {
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.black,
                ]
                return NSAttributedString(string: customDataSource?.getColumnRow(indexPath: indexPath).title ?? "?", attributes: attributes)
            } else {
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.gray,
                ]
                return NSAttributedString(string: customDataSource?.getColumnRow(indexPath: indexPath).title ?? "?", attributes: attributes)
            }
        }
    }
}









//class CustomStringPicker: UIPickerView {
//
//
//
//    let apoinment: [Appoinment] = [Appoinment(appointmentBeginTime: "12:30", appointmentEndTime: "13:30"),
//                                   Appoinment(appointmentBeginTime: "13:30", appointmentEndTime: "14:30")
//    ]
//    lazy var selectedDate: String = apoinment.first?.appointmentEndTime ?? ""
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        delegate = self
//        dataSource = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//extension CustomStringPicker:UIPickerViewDelegate,UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return apoinment.count
//    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//        var rowTitle = ""
//        let pickerLabel = UILabel()
//        pickerLabel.textColor = UIColor.blue
//        pickerLabel.tintColor = .gray
//
//        rowTitle = "\(apoinment[row].appointmentBeginTime) - \(apoinment[row].appointmentEndTime)"
//        selectedDate = rowTitle
//        pickerLabel.text = rowTitle
//        pickerLabel.textAlignment = .center
//
//        return pickerLabel
//    }
//
//}
//
//class StringPicker: UIView {
//
//    let apoinment: [Appoinment] = [Appoinment(appointmentBeginTime: "12:10", appointmentEndTime: "13:30"),
//                                   Appoinment(appointmentBeginTime: "13:30", appointmentEndTime: "14:30")
//    ]
//    let toolbar:UIToolbar = {
//        let tool = UIToolbar()
//        tool.sizeToFit()
//        tool.translatesAutoresizingMaskIntoConstraints = false
//        return tool
//    }()
//    lazy var picker:UIPickerView = {
//        let pckr = UIPickerView()
//        pckr.backgroundColor = .systemGray6
//        pckr.translatesAutoresizingMaskIntoConstraints = false
//        pckr.delegate = self
//        pckr.dataSource = self
//        return pckr
//    }()
//    lazy var selectedDate: String = apoinment.first?.appointmentEndTime ?? ""
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupToolBar() {
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(doneTapped))
//        toolbar.setItems([spaceButton,doneButton], animated: true)
//    }
//    @objc func doneTapped() {
//        print("tapped \(selectedDate)")
//
//    }
//
//    func setupUI() {
//        setupToolBar()
//        addSubview(picker)
//        addSubview(toolbar)
//        NSLayoutConstraint.activate([
//            picker.leadingAnchor.constraint(equalTo: leadingAnchor),
//            picker.trailingAnchor.constraint(equalTo: trailingAnchor),
//            picker.bottomAnchor.constraint(equalTo: bottomAnchor),
//            picker.topAnchor.constraint(equalTo: toolbar.bottomAnchor),
//            toolbar.leadingAnchor.constraint(equalTo: picker.leadingAnchor),
//            toolbar.trailingAnchor.constraint(equalTo: picker.trailingAnchor),
//            toolbar.bottomAnchor.constraint(equalTo: picker.topAnchor),
//            toolbar.heightAnchor.constraint(equalToConstant: 40),
//            toolbar.topAnchor.constraint(equalTo: topAnchor)
//
//        ])
//    }
//}
//extension StringPicker:UIPickerViewDelegate,UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            return apoinment.count
//    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//        var rowTitle = ""
//        let pickerLabel = UILabel()
//        pickerLabel.textColor = UIColor.blue
//        pickerLabel.tintColor = .gray
//
//        rowTitle = "\(apoinment[row].appointmentBeginTime) - \(apoinment[row].appointmentEndTime)"
//        selectedDate = rowTitle
//        pickerLabel.text = rowTitle
//        pickerLabel.textAlignment = .center
//
//        return pickerLabel
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "selam"
//    }
//
//}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}

struct Container: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return PickerColumnRow()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    typealias UIViewType = UIView
    
    
    
}

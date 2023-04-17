

import UIKit
import SnapKit
import PhotosUI

final class CreateRecipeViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var createRecipeLabel: UILabel!
    private var productImageView: UIImageView!
    private var editImageView: UIImageView!
    private var nameTF: UITextField!
    private var servesView: UIView!
    private var servesImageView: UIImageView!
    private var servesLabel: UILabel!
    private var servesQuantityTF: UITextField!
    private var servesArrowImageView: UIImageView!
    private var cookTimeView: UIView!
    private var cookTimeImageView: UIImageView!
    private var cookTimeLabel: UILabel!
    private var cookTimeDurationTF: UITextField!
    private var cookTimeArrowImageView: UIImageView!
    private var ingredientsLabel: UILabel!
    private var tableViewIngredients: UITableView!
    private var numberOfCells = 1 {
        willSet {
            saveOutlets()
        }
    }
    private var plusIngerientImageView: UIImageView!
    private var addLabel: UILabel!
    private var createRecipeButton: UIButton!
    private var pickerToolbar: UIToolbar!
    private var servesPicker, cookTimePicker: UIPickerView!
    private var textServesQuantity: String = "0" {
        didSet {
            servesQuantityTF.text = textServesQuantity
        }
    }
    private let maxCookTimeDuration = "4+ hours"
    private var textCookTimeDuration: String = "0 min" {
        didSet {
            if textCookTimeDuration == maxCookTimeDuration {
                cookTimeDurationTF.text = textCookTimeDuration
            } else {
                cookTimeDurationTF.text = "\(textCookTimeDuration) min"
            }
        }
    }
    private let arrayServesQuantuty = Array(1...10)
    private var arrayCookTimeDuration = Array(1...5).map { String($0)}
    private var keyboardDismissTapGesture: UIGestureRecognizer?
    private var arrayIngredients: [Ingredient]? = [Ingredient()] {
        didSet {
            print("""
                    Total quantity: \(arrayIngredients?.count ?? 0)
                    name: \(arrayIngredients?.last?.name ?? "")
                    quantity: \(arrayIngredients?.last?.quantity ?? "")
                    """)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setup()
        setLayout()
        setArrayCookTimeDuration()
        registerForKBNotifications()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setScrollViewContentSize()
        tabBarController?.tabBar.isHidden = true
        registerForKBNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotification()
        super.viewWillDisappear(animated)
    }
    
    func setup() {
        
        pickerToolbar = UIToolbar()
        pickerToolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        pickerToolbar.setItems([flexSpace, doneButton], animated: true)
        pickerToolbar.updateConstraintsIfNeeded()
        
        servesPicker = UIPickerView()
        servesPicker.contentMode = .bottom
        servesPicker.delegate = self
        servesPicker.dataSource = self
        
        cookTimePicker = UIPickerView()
        cookTimePicker.contentMode = .bottom
        cookTimePicker.delegate = self
        cookTimePicker.dataSource = self
        
        scrollView = UIScrollView(frame: view.frame)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        createRecipeLabel = UILabel()
        createRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        createRecipeLabel.text = "Create recipe"
        createRecipeLabel.font = UIFont.poppins(24, weight: PoppinsWeight.bold)
        scrollView.addSubview(createRecipeLabel)
        
        productImageView = UIImageView()
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.backgroundColor = .neutral10
        productImageView.layer.cornerRadius = 12
        productImageView.clipsToBounds = true
        scrollView.addSubview(productImageView)
        
        editImageView = UIImageView(image: UIImage(named: "Edit"))
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        editImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getImage))
        editImageView.addGestureRecognizer(tapGesture)
        scrollView.addSubview(editImageView)
        
        nameTF = UITextField()
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.layer.borderWidth = 1
        nameTF.layer.cornerRadius = 10
        nameTF.layer.borderColor = UIColor.primary50?.cgColor
        nameTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        nameTF.textColor = UIColor.neutral100
        nameTF.indent(size: 15)
        nameTF.delegate = self
        scrollView.addSubview(nameTF)
        
        servesView = UIView()
        servesView.translatesAutoresizingMaskIntoConstraints = false
        servesView.backgroundColor = UIColor.neutral10
        servesView.layer.cornerRadius = 12
        servesView.isUserInteractionEnabled = true
        scrollView.addSubview(servesView)
        
        servesImageView = UIImageView()
        servesImageView.translatesAutoresizingMaskIntoConstraints = false
        servesImageView.image = UIImage(named: "servesQuantityIcon")
        servesView.addSubview(servesImageView)
        
        servesLabel = UILabel()
        servesLabel.translatesAutoresizingMaskIntoConstraints = false
        servesLabel.text = "Serves"
        servesLabel.font = .poppins(16, weight: .bold)
        servesLabel.textColor = .neutral100
        servesView.addSubview(servesLabel)
        
        servesQuantityTF = UITextField()
        servesQuantityTF.translatesAutoresizingMaskIntoConstraints = false
        servesQuantityTF.placeholder = textServesQuantity
        servesQuantityTF.font = .poppins(14, weight: .regular)
        servesQuantityTF.textColor = .neutral50
        servesQuantityTF.inputView = servesPicker
        servesQuantityTF.inputAccessoryView = pickerToolbar
        servesQuantityTF.delegate = self
        servesView.addSubview(servesQuantityTF)
        
        servesArrowImageView = UIImageView()
        servesArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        servesArrowImageView.image = UIImage(named: "ArrowRightIcon")
        servesView.addSubview(servesArrowImageView)
        servesArrowImageView.isUserInteractionEnabled = true
        let servesTap = UITapGestureRecognizer(target: self, action: #selector(setServesQuantity))
        servesArrowImageView.addGestureRecognizer(servesTap)
        
        cookTimeView = UIView()
        cookTimeView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.backgroundColor = UIColor.neutral10
        cookTimeView.layer.cornerRadius = 12
        cookTimeView.isUserInteractionEnabled = true
        scrollView.addSubview(cookTimeView)
        
        cookTimeImageView = UIImageView(image: UIImage(named: "cookTimeIcon"))
        cookTimeImageView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.addSubview(cookTimeImageView)
        
        cookTimeLabel = UILabel()
        cookTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cookTimeLabel.text = "Cook time"
        cookTimeLabel.font = .poppins(16, weight: .bold)
        cookTimeLabel.textColor = .neutral100
        cookTimeView.addSubview(cookTimeLabel)
        
        cookTimeDurationTF = UITextField()
        cookTimeDurationTF.translatesAutoresizingMaskIntoConstraints = false
        cookTimeDurationTF.placeholder = textCookTimeDuration
        cookTimeDurationTF.font = .poppins(14, weight: .regular)
        cookTimeDurationTF.textColor = .neutral50
        cookTimeDurationTF.inputView = cookTimePicker
        cookTimeDurationTF.inputAccessoryView = pickerToolbar
        cookTimeDurationTF.delegate = self
        cookTimeView.addSubview(cookTimeDurationTF)
        
        cookTimeArrowImageView = UIImageView(image: UIImage(named: "ArrowRightIcon"))
        cookTimeArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.addSubview(cookTimeArrowImageView)
        cookTimeView.isUserInteractionEnabled = true
        cookTimeArrowImageView.isUserInteractionEnabled = true
        let tapCookTime = UITapGestureRecognizer(target: self, action: #selector(setCookTime))
        cookTimeArrowImageView.addGestureRecognizer(tapCookTime)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.font = UIFont.poppins(20, weight: PoppinsWeight.bold)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.textColor = .neutral100
        scrollView.addSubview(ingredientsLabel)
        
        tableViewIngredients = UITableView()
        tableViewIngredients.translatesAutoresizingMaskIntoConstraints = false
        tableViewIngredients.backgroundColor = .gray
        tableViewIngredients.register(UINib(nibName: "IngredientsTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        tableViewIngredients.delegate = self
        tableViewIngredients.dataSource = self
        tableViewIngredients.separatorStyle = .none
        tableViewIngredients.rowHeight = 60
        tableViewIngredients.backgroundColor = .yellow
        scrollView.addSubview(tableViewIngredients)
        
        plusIngerientImageView = UIImageView()
        plusIngerientImageView.translatesAutoresizingMaskIntoConstraints = false
        plusIngerientImageView.image = UIImage(named: "Union")
        plusIngerientImageView.isUserInteractionEnabled = true
        let addTapGesture = UITapGestureRecognizer(target: self, action: #selector(addIngredientCell))
        plusIngerientImageView.addGestureRecognizer(addTapGesture)
        scrollView.addSubview(plusIngerientImageView)
        
        addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.text = "Add new ingredient"
        addLabel.font = .poppins(16, weight: .bold)
        addLabel.textColor = .neutral100
        addLabel.isUserInteractionEnabled = true
        addLabel.addGestureRecognizer(addTapGesture)
        scrollView.addSubview(addLabel)
        
        createRecipeButton = UIButton(type: .system)
        createRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        createRecipeButton.setTitle("Create recipe", for: .normal)
        createRecipeButton.titleLabel?.font = .poppins(16, weight: .regular)
        createRecipeButton.tintColor = .white
        createRecipeButton.layer.cornerRadius = 8
        createRecipeButton.backgroundColor = .primary50
        scrollView.addSubview(createRecipeButton)
        
    }
    
    func setLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        createRecipeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(19)
            make.trailing.equalToSuperview().inset(-19)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(createRecipeLabel).inset(44)
            make.trailing.equalTo(view).inset(16)
            make.leading.equalTo(view).inset(16)
            make.height.equalTo(200)
        }
        
        editImageView.snp.makeConstraints { make in
            make.top.trailing.equalTo(productImageView).inset(0)
            make.width.equalTo(72)
            make.height.equalTo(80)
        }
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).inset(-16)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(44)
        }
        
        servesView.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).inset(-15.6)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(60)
        }
        
        servesImageView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.leading.equalTo(servesView).inset(16)
            make.centerY.equalToSuperview()
        }
        servesLabel.snp.makeConstraints { make in
            make.leading.equalTo(servesImageView.snp.trailing).inset(-16)
            make.centerY.equalToSuperview()
        }
        
        servesArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().inset(16)
        }
        
        servesQuantityTF.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(servesArrowImageView.snp.leading).inset(-8)
        }
        
        
        cookTimeView.snp.makeConstraints { make in
            make.top.equalTo(servesView.snp.bottom).inset(-15.6)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(60)
        }
        
        cookTimeImageView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.leading.equalTo(cookTimeView).inset(16)
            make.centerY.equalToSuperview()
        }
        
        cookTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(cookTimeImageView.snp.trailing).inset(-16)
            make.centerY.equalToSuperview()
            
        }
        
        cookTimeArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().inset(16)
        }
        
        cookTimeDurationTF.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(cookTimeArrowImageView.snp.leading).inset(-8)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(cookTimeView.snp.bottom).inset(-24.4)
            make.leading.equalTo(productImageView)
        }
        
        tableViewIngredients.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(ingredientsLabel.snp.bottom).inset(-8)
            make.height.equalTo(Int(tableViewIngredients.rowHeight) * numberOfCells)
        }
        
        plusIngerientImageView.snp.makeConstraints { make in
            make.top.equalTo(tableViewIngredients.snp.bottom).inset(-8)
            make.leading.equalTo(productImageView)
            make.height.width.equalTo(24)
        }
        
        addLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusIngerientImageView.snp.trailing).inset(-8)
            make.centerY.equalTo(plusIngerientImageView)
        }
        
        createRecipeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView)
            make.height.equalTo(56)
            make.top.equalTo(addLabel.snp.bottom).inset(-58.2)
        }
        
    }
    
    func registerForKBNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    func setArrayCookTimeDuration() {
        for i in 2...48 {
            arrayCookTimeDuration.append(String(i*5))
        }
        arrayCookTimeDuration.append(maxCookTimeDuration)
    }
    
    fileprivate func setScrollViewContentSize() {
        let createRecipeButtonFrame = view.convert(createRecipeButton.frame, to: view)
        if numberOfCells > 1 {
            scrollView.contentSize = CGSize(width: view.bounds.width, height: createRecipeButtonFrame.maxY + 60)
        } else {
            scrollView.contentSize = CGSize(width: view.bounds.width, height: createRecipeButtonFrame.maxY)
        }
    }
    
    private func saveOutlets() {
        for index in 0..<numberOfCells {
            guard let cell = tableViewIngredients.cellForRow(at: IndexPath(item: index, section: 0)) as? IngredientsTableViewCell else {return}
            arrayIngredients?[index].quantity = cell.ingredientQuantityTF.text
            arrayIngredients?[index].name = cell.ingredientNameTF.text
        }
    }
    
    //MARK: - objc functions for actions
    
    @objc func addIngredientCell() {
        numberOfCells += 1
        arrayIngredients?.append(Ingredient())
        tableViewIngredients.snp.updateConstraints { make in
            make.height.equalTo(Int(tableViewIngredients.rowHeight) * numberOfCells)
        }
        scrollView.setContentOffset(CGPoint(x: 0, y: ( (numberOfCells - 1) * 60)), animated: true)
        tableViewIngredients.reloadData()
        setScrollViewContentSize()
        
        
    }
    
    @objc func kbWillHide() {
        view.frame.origin.y = 0
        if keyboardDismissTapGesture != nil {
            view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        view.frame.origin.y = -kbFrameSize.height
        
        if keyboardDismissTapGesture == nil {
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(doneButtonPressed))
            keyboardDismissTapGesture?.cancelsTouchesInView = false
            view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }
    
    @objc func setCookTime() {
        cookTimeDurationTF.becomeFirstResponder()
    }
    
    @objc func setServesQuantity() {
        servesQuantityTF.becomeFirstResponder()
    }
    
    @objc func doneButtonPressed() {
        self.view.endEditing(true)
    }
    
    @objc func getImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images, .livePhotos])
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
}

//MARK: - TableView Delegate&DataSource

extension CreateRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as? IngredientsTableViewCell else {return UITableViewCell()}
        cell.ingredientQuantityTF.inputAccessoryView = pickerToolbar
        //set cell's handlers
        cell.deleteHandler = {
            self.numberOfCells -= 1
            self.tableViewIngredients.deleteRows(at: [indexPath], with: .automatic)
            self.arrayIngredients?.remove(at: indexPath.row)
            self.setScrollViewContentSize()
            self.tableViewIngredients.snp.updateConstraints { make in
                make.height.equalTo(Int(self.tableViewIngredients.rowHeight) * self.numberOfCells)
            }
            self.tableViewIngredients.reloadData()
            self.setScrollViewContentSize()
        }
        
        //setup cell's outlets
        let name = arrayIngredients?[indexPath.row].name
        let quantity = arrayIngredients?[indexPath.row].quantity
        cell.SetOutlets(name: name, quantity: quantity)
        
        return cell
    }
    
    
}

//MARK: - PHPickerView Delegate

extension CreateRecipeViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard let image = image as? UIImage, error == nil else {
                    print(error?.localizedDescription as Any)
                    return
                }
                DispatchQueue.main.async {
                    self.productImageView.image = image
                }
            }
        }
        dismiss(animated: true)
    }
    
}

//MARK: - UIPickerView Delegate

extension CreateRecipeViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case servesPicker: return String(arrayServesQuantuty[row])
        case cookTimePicker: return arrayCookTimeDuration[row]
        default: return "No such picker"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case servesPicker:
            textServesQuantity = String(arrayServesQuantuty[row])
        case cookTimePicker:
            textCookTimeDuration = arrayCookTimeDuration[row]
        default: break
        }
    }
    
}

//MARK: - UIPickerView DataSource

extension CreateRecipeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case servesPicker: return arrayServesQuantuty.count
        case cookTimePicker: return arrayCookTimeDuration.count
        default: return 1
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension CreateRecipeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

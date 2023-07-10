//
//  main.swift
//  HomeWork5
//
//  Created by LinhMAC on 09/07/2023.
//

import Foundation
//Viết một ứng dụng cho phép quản lý danh sách điểm thi của các sinh viên. Mỗi sinh viên sẽ có thông tin như sau: Tên, mã sinh viên, điểm toán, điểm lý, điểm hóa. Ứng dụng cho phép thêm mới sinh viên, cập nhật điểm số của sinh viên, hiển thị danh sách sinh viên theo thứ tự điểm trung bình giảm dần. Sử dụng Struct.
struct Student {
    var name: String
    var idNumber: Int
    var mathScores: Float
    var physicsScores: Float
    var chemistryScores: Float
    
    init(name: String, idNumber: Int, mathScores: Float, physicsScores: Float, chemistryScores: Float) {
        self.name = name
        self.idNumber = idNumber
        self.mathScores = mathScores
        self.physicsScores = physicsScores
        self.chemistryScores = chemistryScores
    }
    
    func averageScores() -> Float {
        return (mathScores + physicsScores + chemistryScores) / 3
    }
}

var studentList = [Student]()

func addStudent(newStudent: Student) {
    studentList.append(newStudent)
    print("Sinh viên mới: \(newStudent.name), Mã sinh viên: \(newStudent.idNumber), Điểm toán: \(newStudent.mathScores), Điểm lý: \(newStudent.physicsScores), Điểm hoá: \(newStudent.chemistryScores)")
}


func updateScores(studentID: Int, mathScore: Float, physicsScore: Float, chemistryScore: Float) {
    var foundStudent = false
    for (index, student) in studentList.enumerated() {
        if student.idNumber == studentID {
            studentList[index].mathScores = mathScore
            studentList[index].physicsScores = physicsScore
            studentList[index].chemistryScores = chemistryScore
            foundStudent = true
            break
        }
    }
    
    if foundStudent {
        print("Đã cập nhật điểm số của sinh viên có mã \(studentID)")
    } else {
        print("Không tìm thấy sinh viên có mã \(studentID)")
    }
}

func sortStudentsByAverageScore() -> [Student] {
    return studentList.sorted(by: { $0.averageScores() > $1.averageScores() })
}

let Linh = Student(name: "Linh", idNumber:1, mathScores: 5.6, physicsScores: 5.5, chemistryScores: 6.0)
let Son = Student(name: "Sơn", idNumber:2, mathScores: 5.7, physicsScores: 5.6, chemistryScores: 6.1)
let Tuan = Student(name: "Tuấn", idNumber:3, mathScores: 8.0, physicsScores: 6.0, chemistryScores: 7.0)
addStudent(newStudent: Tuan)
addStudent(newStudent: Son)
addStudent(newStudent: Linh)
updateScores(studentID:3, mathScore: 7.5, physicsScore: 8.0, chemistryScore: 7.5)

let sortedStudents = sortStudentsByAverageScore()

for (index, student) in sortedStudents.enumerated() {
    print("\(index + 1). \(student.name) - Điểm trung bình \(student.averageScores())")
}
/*
 Viết một ứng dụng cho phép quản lý thông tin của các sản phẩm trong cửa hàng. Mỗi sản phẩm sẽ có thông tin như sau: Tên, mã sản phẩm, giá bán, số lượng trong kho. Ứng dụng cho phép thêm mới sản phẩm, cập nhật thông tin của sản phẩm, hiển thị danh sách sản phẩm, tìm kiếm sản phẩm theo tên. Sử dụng Class.
 */
class Product {
    var name: String
    var idNumber: Int
    var price: Int
    var quantity: Int
    init(name: String, idNumber: Int, price: Int, quantity: Int) {
        self.name = name
        self.idNumber = idNumber
        self.price = price
        self.quantity = quantity
    }
    func updatePrice(newPrice: Int) {
        price = newPrice
    }
    func updateQuantity(newQuantity: Int) {
        quantity = newQuantity
    }
}
var productList = [Product]()
func addProduct(newProduct: Product) {
    productList.append(newProduct)
}
func updateProduct(productID: Int, newPrice: Int?, newQuantity: Int?) {
    var foundProduct = false
    for (index, product) in productList.enumerated() {
        if product.idNumber == productID {
            if let newPrice = newPrice {
                productList[index].price = newPrice
            }
            if let newQuantity = newQuantity {
                productList[index].quantity = newQuantity
            }
            foundProduct = true
            break
        }
    }
    if foundProduct {
        print("Đã cập nhật thông tin của sản phẩm có mã \(productID)")
    } else {
        print("Không tìm thấy sản phẩm có mã \(productID)")
    }
}
func searchProduct(name: String) -> [Product] {
    return productList.filter{$0.name == name}
    
}
let product01 = Product(name: "iPhone 14", idNumber: 1, price: 25000000, quantity: 100)
let product02 = Product(name: "Samsung Galaxy Fold 4", idNumber: 2, price: 40000000, quantity: 50)
let product03 = Product(name: "Google Pixel 7", idNumber: 3, price: 220000000, quantity: 30)

addProduct(newProduct: product01)
addProduct(newProduct: product02)
addProduct(newProduct: product03)

updateProduct(productID:1, newPrice:27000000, newQuantity:0)

let searchedProducts = searchProduct(name:"Google Pixel 7")
for product in searchedProducts {
    print("\(product.name) - Giá bán \(product.price), Số lượng trong kho \(product.quantity)")
}

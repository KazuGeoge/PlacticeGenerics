protocol ModelObject {
    
    func decode(data: Int) -> Int
}

struct Article: ModelObject {
    
    var num1: Int = 100
    
    func decode(data: Int) -> Int {
        return  data + num1
    }
}
// 最後に渡すsuccessをInt型に
func call(_ urlInt: Int, success: (Int) -> Void) {
    let article = Article()
    success(article.decode(data: urlInt))
}

call(100) { (data) in
    var num = 100
    num += data
    print(num)
}

// 最後に渡すsuccessをジェネリクス型に
func callGenerics<T: ModelObject>(_ urlInt: Int, success: (T) -> Void) {
    let article = Article()
//    let article: ModelObject = Article()
    success(article.decode(data: urlInt))
}

callGenerics(100) { (data) in
    var num = 100
    num += data
    print(num)
}

// 数字でなくてないけないNumericの型制約でも上手くいかない
func callGenericsNumeric<T: Numeric>(_ urlInt: Int, success: (T) -> Void) {
    let article = Article()
    //    let article: ModelObject = Article()
    success(article.decode(data: urlInt))
}

callGenericsNumeric(100) { (data) in
    var num = 100
    num += data
    print(num)
}


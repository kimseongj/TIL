import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var size = sizes
    var sero = [Int]()
    var garo = [Int]()
    
    for i in 0..<size.count {
        size[i].sort()
    }
    
    for f in 0..<size.count {
        sero.append(size[f][0])
        garo.append(size[f][1])
    }
    var seromax = sero.max()!
    var garomax = garo.max()!
    
    
    return seromax*garomax
}


// max min에 강제추출 해야하는 이유 = max min은 옵셔널 값이므로 강제추출 혹은 바인딩해줘야함 
// 파라미터에서 넘어오는 배열 왜 옮겨서 써야하는지 = 함수에서 매개변수로 들어온 값은 let이라 정렬하거나 배열 값 바꾸려면 var로 바꿔서 사용해야함

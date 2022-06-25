import Foundation

func solution(_ record:[String]) -> [String] {
   var idList = [String : String]()
   var enterList = [[String]]()
   var result = [String]()
   var sequenceId = [String]()
   var count : Int = 0
   var sequenceEnter = [String]()
    
  for i in record {
     let sp = i.components(separatedBy: " ")
    
      if sp[0] == "Enter" {
          count += 1
          idList[sp[1]] = sp[2]
          sequenceId.append(sp[1])
          sequenceEnter.append(sp[0])
          
      }
      if sp[0] == "Leave" {
          count += 1
          sequenceId.append(sp[1])
          sequenceEnter.append(sp[0])
      }
       
      if sp[0] == "Change" {
          idList[sp[1]] = sp[2]
      }
      
         
  }
    for j in 0..<sequenceEnter.count{
 
     
     if sequenceEnter[j] == "Enter" {
         result.append("\(idList[sequenceId[j]]!)님이 들어왔습니다.")
     }
     
     if sequenceEnter[j] == "Leave" {
         result.append("\(idList[sequenceId[j]]!)님이 나갔습니다.")
     }
 }
    return result
}

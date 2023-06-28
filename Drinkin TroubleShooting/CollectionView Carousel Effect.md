요구사항을 충족하기 위해 Carousel Effect를 사용할 필요가 있었다.



Carousel Effect를 만들기 위해서 `ScrollView`(CollectionView는 ScrollView를 상속받고 있음)에서 제공하는 몇가지 메서드를 알아야 한다. 

- scrollViewDidScroll
  - 스크롤뷰가 스크롤 되는 동안 계속 호출된다. 
- scrollViewWillBeginDragging
  - 스크롤뷰의 드래그가 시작될 때 호출된다.
- scrollViewDidEndDragging
  - 스크롤뷰의 드래그가 끝났을 때 호출된다. 
- scrollViewWillEndDragging
  - 스크롤뷰 드래그가 끝나려 할 때 호출된다. 
## URLSession shared VS default

:fire: URLSession을 사용할 때 싱글톤인 `shared`를 사용하여 네트워킹을 할지 `default`로 새로운 `URLSession.init(configuration: URLSessionConfiguration.default)`를 만들어 사용할지 고민이 되었다.

아직 `default`를 사용해서 URLSession을 다뤄본적은 없지만 막연하게 싱글톤 패턴을 사용하는 것은 지양하는 것이 좋다고 들었다.(어디서 들었더라...)




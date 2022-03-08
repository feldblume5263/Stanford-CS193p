# body와 some View에 대해서
<br/>

`var body` 는 메모리에 저장되지 않는다.<br/>

그러면 `var body`의 역할은 무엇일까??
<br/><br/>

**함수들을 실행한다.**
<br/><br/>
```
var body: some View {
	return Text("Hello World")
}
```

여기에서는 Text라는 함수를 실행한다.<br/>
Text는 View라는 레고조각이다.<br/>
<br/><br/>

Text는 SwiftUI의 어딘가에,<br/>
```
struct Text: View {
	var body: some View {
		...
	}
}
```
다음과 같이 선언되어 있을 것이다.<br/>
<br/><br/>

some View는 그 자체로 Type이 아니다.<br/>
이것은 컴파일러에게 이렇게 말해준다.<br/><br/>

"야! 이 변수의 타입은 아마 어떤 View일거야. 한번 알아보고 컴파일할 때 채워넣어봐!"<br/>

```
var body: Text {
	return Text("Hello World")
}
```

컴파일러는 위처럼 Text가 return되는 것을 확인했기 때문에, 이렇게 some View를 컴파일 단계에서 Text 타입으로 변환해준다.<br/><br/>
이렇게 모호하게 선언한 후, 컴파일 단계에서 결정되는 타입을 **Opaque Types**이라고 한다.<br/>
<br/><br/>


우리가 직접 body를 구성하기 때문에 충분히 코딩 단계에서 명시적으로 type을 넣어줄 수 있을텐데, 왜 some View라는 Opaque 타입으로 리턴해주는 것일까?<br/><br/>

먼저 var body가 하나를 return 하는 것 뿐만 아니라 View 전체를 구성하는 것이 가능하기 때문이다.<br/>
또한 view에 padding을 주거나 하는 등 return 타입이 복잡해질 수 있기 때문이다.<br/>
다음과 같이 말이다.

```
var body: some View {
	return ZStack() {
		RoundedRectangle(cornerRadius: 25.0)
			.stroke(lineWidth: 3)
			.foregroundColor(.blue)
			.padding(.horizontal)
		Text("Hello World")
			.padding(.all)
	}
}
```
<br/>

먼저 Text와 Rectangle이 view에서 합쳐져 있다.

여기에서 `Text().padding()`은 Text를 리턴하지 않는다.<br/>
padding이 추가된 Text를 리턴한다. 그리고 이것은 Text와 다르다!<br/><br/>
조금 더 자세히 이야기하자면, SwiftUI에는 view modifier라는 것이 있는데, 우리가 위에서 했던 것처럼 padding 등을 추가할 때마다
상황에 맞추어 modified된 view가 되는 것이다.<br/><br/>

**그리고 우리가 그 모든 view들의 타입을 다 명시할 수 없기 때문에 Opaque Types를 사용하는 것이다.**




<br/><br/>
https://skagh.tistory.com/90<br/>
https://2unbini.github.io/%F0%9F%93%82%20all/swift/kunbon/swiftUI-someView/<br/>





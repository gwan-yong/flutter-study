enum Status {
  approved,
  pending,
  rejected
}// enum은 Sting으로 대체 가능하나 오타를 줄이거나 어떠한 선택지가 있는데 정의 할 수 있도록해 줌
// 함수 안에서 선언 불가능

int addTwoNumNamed({
  required int a,
  required int b //required 키워드는 매개변수가  null값이 불가능한 타입이면 기본값을 지정하거나 필수로 입력해야한다는 의미
  //파라미터를 이름으로 지정해주어야함(네임드 파라미터) a: , b:
}){
  return a+b;
}

int addTwoNumPositional(int a,[int b = 2]){
  //파라미터 순서로 파라미터 위치가 지정됨(포지셔널 파라미터), 파라미터의 기본값을 []로 지정해줌
  return a+b;
}

int addTwoNumNamedDefault({
required int a,
int b =2, //네임드 파라미터에서 기본값 지정시 required키워드를 생략하고 기본값 지정
}){
  return a+b;
}
int addTwoNumNamedAndPositional(int a,{
 required int b,
int c =4,//네임드 파라미터와 포지셔널 파라미터 혼용 가능, 단 혼용시 포지셔널 파라미터가 네임드 파라미터보다 먼저 위치해야함
}) {
  return a+b+c;
}

typedef Operation = void Function(int x, int y);
//typedef  키워드는 함수의 선언부를 정의 하는 키워드
void add(int x, int y){
  print('결과값 ${x+y}');
}//typedef  키워드로 add 함수를 정의
void subtract(int x, int y){
  print('결과값 ${x-y}');
}//typedef  키워드로 subtract 함수를 정의
void calculate(int x, int y, Operation oper){
  oper(x,y); // 함수를 값처럼 사용하여 사용 가능
}


void main(){//메인 함수

  //변수
  print('hello world');// 콘솔 출력=

  var name = "gwan-yong";// 변수 선언 : 타입은 추론하기에 선언하지 않음
  print(name);

  //name = 123; //에러 발생 : 이전에 타입이 추론된 변수 타입은 고정됨

  dynamic iosVersion = "ios18"; // dynamic으로 선언된 변수는 타입이 고정되지 않음
  iosVersion = 18;

  final String phone = "iPhone";
  //phone = "galaxy"; // 에러 : final로 선언된 변수는 이후에 값이 변경이 불가능하며 함수가 실행 이후에 값이 지정
  const String PC = "mac";
  //PC = "windows";// 에러 : const로 선언된 변수는 이후에 값이 변경이 불가능하며 함수가 실행 이전에 값이 지정됨
  //따라서 코드를 실행하지 않은 상태에서 값이 확정이면 const를 실행돌때 확정이면 final을 사용

  //컬렉션
  List<String> phoneList = ['apple','samsung','google','lg'];//리스트 : 여러값을 순서댜로 저장

  print(phoneList);//리스트 출력 : ['apple','samsung','google','lg']
  print(phoneList[0]); // 리스트의 1번째 원소 출력 : appple
  print(phoneList[3]); // 리스트의 4번째 원소 출력 : lg
  print(phoneList.length); // 리스트의 길이 출력 : 4

  phoneList[3] = 'sony'; // 리스트의 4번째 원소 값을 변경 :['apple','samsung','google','sony']
  phoneList.add('nothing'); // 리스트의 새로운 값 추가 : ['apple','samsung','google','sony','nothing']

  final newPhoneList = phoneList.where((name) => name =='apple' || name == 'sony');
  //where 함수 : list.where((순회되어 추출되는 list 요소 배개변수) => 반환된는 조건);

  print(newPhoneList); // 필터링 된 값들은 iterable로 반환됨 : (apple .sony)
  print(newPhoneList.toList()); // iterable로 봔환된 값을 list로 변환 [apple .sony]

  final newNewPhoneList = phoneList.map((name) => 'design by $name');
  //map 함수 : list.map((순회되어 추출되는 list 요소 배개변수) => 각 요소에 적용할 함수)
  print(newNewPhoneList); // 반환된 값들은 iterable로 저장됨 :(design by apple, design by samsung, design by google, design by sony, design by nothing)
  print(newNewPhoneList.toList()); // iterable로 봔환된 값을 list로 변환 : [design by apple, design by samsung, design by google, design by sony, design by nothing]

  final allPhones = phoneList.reduce((value, element) => value + '+'+element);
  //reduce 함수 : list.reduce(대입되는 매개변수, 순회되어 추출되는 list 요소 배개변수) => 반환할 함수)
  // 반환되는 것은 리스트 요소의 타입과 같아야함
  print(allPhones);// apple+samsung+google+sony+nothing

  final newAllPhones = phoneList.fold<int>(0, (value ,elemnt) => value +elemnt.length);
  // fold 함수 : list.fold(시작할 list 요소의 인덱스 값,(대입되는 매개변수, 순회되어 추출되는 list 요소 배개변수) => 반환할 함수)
  // 반환되는 것은 리스트 요소의 타입과 같아야함
  print(newAllPhones); //29

  Map<String,String> dictionary = {
    'Harry Potter' : '해리포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저',
  }; //map타입 : map<key 타입, value 타입> map 객체 이름 = {key ,value}
  print(dictionary['Harry Potter']); //Harry Potter의 value '해리포터 출력'
  print(dictionary['Hermione Granger']); //Hermione Granger의 value '헤르미온느 그레인저' 출력

  print(dictionary.keys); // dictionary의 모든 key 값 반환 : (Harry Potter, Ron Weasley, Hermione Granger)
  print(dictionary.values); //dictionary의 모든 value 값 반환 : (해리포터, 론 위즐리, 헤르미온느 그레인저)

  Set<String> appleOS = {'iOS','ipadOS','macOS','watchOS','iOS'};//iOS요소 중복,
  print(appleOS);//중복된 iOS 중복되지 않게 출력됨(Set 타입은 중복을 방지해줌) : {iOS, ipadOS, macOS, watchOS}
  print(appleOS.contains('macOS'));//해당 요소가 있는는 경우 ture 값 반환
  List<String> PcOS = ['macOS','windows','windows'];
  print(PcOS); // 출력 값 : [macOS, windows, windows]
  print(Set.from(PcOS));//list를 Set 타입을 변환, 출력값 : {macOS, windows}

  Status status = Status.approved;//enum status 생성
  if(status == Status.approved)//enum으로 정의된 것 사용
    print('승인됨');
  else if(status ==Status.pending)
    print('대기중');
  else if(status ==Status.rejected)
    print('반려됨');
  else
    print('확인 되지 않음');

  //int number1 = null; // 변수에 null값 가능
  int? number2 = null; // 타입뒤에 ?을 붙힌 변수에는 null값 불가능
  number2 ??= 4; // 변수 뒤에 ??=을 붙히면 변수가 null값을 가질 경우에만 저장됨
  print(number2); // 출력 4
  number2 ??= 5; // number2가 null값을 가지지 않기 때문에 대입되지 않음
  print(number2); // 출력 4


  //is 키워드 : 변수 타입을 비교함
  int number3 = 3;

  print(number3 is int); // true 출력
  print(number3 is double);// false 출력
  
  List<int> numbers = [1,2,3,4,5,];
  final allNum = numbers.reduce((value,element) {return value + element;});
  // (매개변수) {함수 냐용} 이러한 형식은 익명함수로 map,reduce,fold 함수와 같이 일회성이 높은 로직에서 주로 사용됨
  final allNumbers = numbers.reduce((value,element) => value+element);
  //(매개변수) => 학수내용  이렇게게 작성하면 익명함수를 좀더 직관적으로 작성한 람다 함수 형식임
  print(allNum);
  
  
  

  print(addTwoNumNamed(a:1,b:2));// named 매개변수 2개
  print(addTwoNumPositional(1)); // positional 매개변수 1개와 디폴트 매겨변수 사용
  print(addTwoNumPositional(1,3)); //positional 매개변수 2개
  print(addTwoNumNamedDefault(a:1));// named 매개변수 1개와 디폴트 매겨변수 사용
  print(addTwoNumNamedAndPositional(1, b: 3, c:7));//named 매개변수와 positional 매개변수 혼용 사용


  Operation oper = add; //typedef로 선언부가 정의된 add 함수 호출
  oper(1,2); // 결과값 3

  oper = subtract;//typedef로 선언부가 정의된 subtract 함수 호출
  oper(1,2);// 결과값 -1

  calculate(2, 3, add);//결과값 5
}

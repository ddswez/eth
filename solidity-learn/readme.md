### 关键字
public：任何人都可以调用该函数，包括DApp的使用者。
private：只有合约本身可以调用该函数（在另一个函数中）。
internal：只有这份合约以及由此产生的所有合约 才能调用。
external：只有外部可以调用该函数，而合约内部不能调用。
view：只查看状态而不改变
pure：也可以自由调用，既不读取也不写入区块链
payable:常常用于将代币发送给合约地址
memory：

### 位运算符
1.& 操作数之间转换成二进制之后每位进行与运算操作（同1取1）
2.| 操作数之间转换成二进制之后每位进行或运算操作（有1取1）
3.~ 操作数转换成二进制之后每位进行取反操作（直接相反）
4.^ 操作数之间转换成二进制之后每位进行异或操作（不同取1）
5.<<操作数转换成二进制之后每位向左移动x位的操作
6.>>操作数转换成二进制之后每位向右移动x位的操作

### 固定长度直接数组byte
一个byte=8个位（XXXX XXXX）X为0或1，二进制表示
byte数组为bytes1，bytes2，。。。，bytes32，以八个位递增，即是对位的封装
举例
bytes1=uint8
bytes2=unit16
。
。
。
bytes32=unit256

使用byte数组的理由：
1.bytesX可以更好地显示16进制
举例：bytes1=0x6A，bytes1=（XXXX XXXX）正好四个表示一个16进制，以此类推
2.bytes数据声明时加入public可以自动生成调用长度的函数
3.bytes内部自带length长度函数，而且长度固定，而且长度不可以被修改



### 动态长度字节数组
1. bytes的初始化  new bytes() 获取bytes的长度和内容，并修改长度内容
2. string 不能直接获取长度和内容 需要转化成bytes
3. 将bytes转化成string
···
bytes name = new bytes(2);
name[0] = 0x7a;
name[1] = 0x68;
return string[name];
···
4. 将bytes32转化成string
···
bytes32 name = 0x7a68;
bytes memory _newName = new bytes(name.length);
for (uint i = 0; i < name.length; i++) {
  _newName[i] = name[i];
}
return string[_newName];
···

###  固定长度数组
1.如果不赋值，那么默认所有位均为0
2.支持直接使用.length查看数组长度，但不支持对数组长度做修改
3.不支持通过.push添加数据
···
uint[3] testarr1;//不进行赋值直接声明数组
uint[3] testarr2=[1,2,3];//声明数组并进行赋值
···

### 可变长度数组
1.如果不初始化就无法单独赋值，但可以push或者改长度使有值之后再进行赋值。即必须修改的这一位不能为空（试了好久才发现，我一开始还以为是bug）
2.支持直接使用.length查看数组长度，也支持对数组长度做修改。
将数组长度缩小则会从前往后保留
将数组长度增长则后面原本没有值的位会被默认置0
3.支持直接通过.push方法在末尾添加数值

### 固定长度二维数组
1.初始化时，uint[ i ] [ j ]表示有j个元素，每个元素包含i个值（和其他许多语言不同）
```
uint[2][3] grade = [[1,2],[2,3],[4,5]];
```
2.二维数组可以直接获取长度，既可以获得所有元素个数，也可以获得单独元素有多少值
3.对二维数组进行增删改等操作时时是与初始化时反过来的，即uint[ i ] [ j ]表示第i个元素的第j个值（和其他许多语言一样）
4.不支持push方法，也不支持对长度进行修改

### 可变长度的二维数组
1.支持对长度进行修改，修改后默认值为0
2.未声明的值不能直接赋值，修改长度之后默认有值才可以

### modifier
```
modifier OnlyOwner{
  require(owner == msg.sender);
  _;
}
function change() OnlyOwner {

}

---
contract modifierTest {
  uint public a = 0;
  modifier mod1 {
    a = 1;
    _;
    a = 2;
  }
  modifier mod2 {
    a = 3;
    _;
    a = 4;
  }
  // 执行顺序是 a=1; -> a=3; -> a=100; -> a=4; -> a=2;
  function test() mod1 mod2 {
    a = 100;
  }

}
```
